# Class: citrix_xd7
#
#  This class is used to automate the installation of Citrix Xendesktop 7
#    
#   The windows firewall is automatically configured to allow the necessary ports
#   User Account Control needs to be disabled in order for the powershell operation to add the net-framework feature to work properly
#   The Net-Framework-Core windows feature is added automatically as it is required by the Xendesktop 7 installer
# 
# == Parameters: 
#
#  $source:: The location of the Xendesktop 7 installation files. 
#     Defaults to D:\x64\XenDesktop Setup which is the installation location on the DVD media.
#     Valid values: Network Share - '//server/networkshare/xendesktop/'
#
#  $sql:: The setting determines whether the included version of SQL Server 2012 is installed as part of the installation.
#     Default value: true (install SQL as part of the installation) 
#     Valid values: true and false
#
#  $controller:: The setting determines whether the delivery controller component will be installed.
#      Default value: true (install the delivery controller as part of the installation)
#      Valid values: true or false
#
#  $desktopstudio:: The setting determines whether the desktop studio component will be installed.
#      Default value: true (install desktop studio as part of the installation)
#      Valid values: true or false
#
#  $licenseserver:: The setting determines whether the license server component will be installed.
#      Default value: true (install the license server as part of the installation)
#      Valid values: true or false
#
#  $desktopdirector:: The setting determines whether the desktop director component will be installed.
#      Default value: true (install desktop director as part of the installation)
#      Valid values: true or false
#
#  $storefront:: The setting determine whether the store front component will be installed.
#      Default value: true (install store front as part of the installation)
#      Valid values: true or false
#
#
# == Requires:
# 
# puppetlabs/stdlib
# 
# == Sample Usage:
#
#  class {'citrix_xd7':
#   controller      => true,
#   desktopstudio   => true,
#   licenseserver   => false,
#   desktopdirector => false,
#   storefront      => false,
#   sql             => false,
#  }
#

class citrix_xd7 (
  $source           = 'D:\\x64\\XenDesktop Setup\\',
  #$quiet            = true,  # ToDo
  #$firewall         = true,  # ToDo
  $sql              = true,
    
  #Xendesktop Components
  $controller       = true,
  $desktopstudio    = true,
  $licenseserver    = true,
  $desktopdirector  = true,
  $storefront       = true,
)

{
  
  # Validate all variables
  #validate_bool($quiet)    # ToDo
  #validate_bool($firewall) # ToDo
  validate_bool($sql)
  validate_bool($controller)
  validate_bool($desktopstudio)
  validate_bool($licenseserver)
  validate_bool($desktopdirector)
  validate_bool($storefront)
  

  # Citrix Delivery Controller
  if $controller {
    $controller_install = 'controller,'
  }
  else{
    $controller_install = ''
  }

  # Citrix Desktop Studio
  if $desktopstudio {
    $desktopstudio_install = 'desktopstudio,'
  }
  else{
    $desktopstudio_install = ''
  }
  
  # Citrix License Server
  if $licenseserver {
    $licenseserver_install = 'licenseserver,'
  }
  else{
    $licenseserver_install = ''
  }

  # Citrix Desktop Director
  if $desktopdirector {
    $desktopdirector_install = 'desktopdirector,'
  }
  else{
    $desktopdirector_install = ''
  }

  # Citrix Storefront
  if $storefront {
    $storefront_install = 'storefront,'
  }
  else{
    $storefront_install = ''
  }

  # SQL Server Installation 
  if $sql {
    $sql_install = ''
  }
  else{
    $sql_install = '/nosql'
  }

  # Add Dot Net Framework Feature
  exec {'Install dotnet':
      command   => "Add-WindowsFeature Net-Framework-Core",
      provider  => powershell,
      unless    =>  "(Get-WindowsFeature -name Net-Framework-Core).Installed", # Check if Net Framework has already been installed    
  } ->
  
  # Install Xendesktop 7 from installation source
  exec { 'Install XD':
    command => "XenDesktopServerSetup.exe /components $controller_install$desktopstudio_install$licenseserver_install$desktopdirector_install$storefront_install $sql_install /quiet /configure_firewall",
    path    => "$source",
}

}