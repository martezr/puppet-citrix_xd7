# Citrix Xendesktop 7 Database Configuration

class citrix_xd7::database
(
  $databaseserver         = $citrix_xd7::databaseserver,
  $databasenamesite       = $citrix_xd7::databasenamesite,
  $databasenamelogging    = $citrix_xd7::databasenamelogging,
  $databasenamemonitor    = $citrix_xd7::databasenamemonitor,
  $xd7site                = $citrix_xd7::xd7site,
  $databaseuser           = $citrix_xd7::databaseuser,
  $databasepassword       = $citrix_xd7::databasepassword,
)
{

   
  # Create New XenDesktop Site Database
  exec {'Create New XenDesktop Site Database':
      command   => "Import-Module 'C:/Program Files/Citrix/XenDesktopPoshSdk/Modules/Citrix.XenDesktop.Admin.V1/Citrix.XenDesktop.Admin';Add-PSSnapin Citrix.*;\$securepass = ConvertTo-SecureString -String $databasepassword -AsPlainText -Force;\$databasecreds = New-Object System.Management.Automation.PSCredential $databaseuser,\$securepass; New-XDDatabase  -SiteName $xd7site -DataStore Site -DatabaseServer $databaseserver -DatabaseName $databasenamesite -DatabaseCredentials \$databasecreds",
      provider  => powershell,
#     unless    =>  "Test-ConfigDBConnection -DBConnection", # Check if an existing site database exists on the database server   
  }
  
  # Create New XenDesktop Logging Database
  exec {'Create New XenDesktop Logging Database':
      command   => "Import-Module 'C:/Program Files/Citrix/XenDesktopPoshSdk/Modules/Citrix.XenDesktop.Admin.V1/Citrix.XenDesktop.Admin';Add-PSSnapin Citrix.*;\$securepass = ConvertTo-SecureString -String $databasepassword -AsPlainText -Force;\$databasecreds = New-Object System.Management.Automation.PSCredential $databaseuser,\$securepass; New-XDDatabase  -SiteName $xd7site -DataStore Logging -DatabaseServer $databaseserver -DatabaseName $databasenamelogging -DatabaseCredentials \$databasecreds",
      provider  => powershell,
#     unless    =>  "Test-LogDBConnection -DBConnection", # Check if an existing site database exists on the database server    
  } 

    # Create New XenDesktop Monitor Database
  exec {'Create New XenDesktop Monitor Database':
      command   => "Import-Module 'C:/Program Files/Citrix/XenDesktopPoshSdk/Modules/Citrix.XenDesktop.Admin.V1/Citrix.XenDesktop.Admin';Add-PSSnapin Citrix.*;\$securepass = ConvertTo-SecureString -String $databasepassword -AsPlainText -Force;\$databasecreds = New-Object System.Management.Automation.PSCredential $databaseuser,\$securepass; New-XDDatabase  -SiteName $xd7site -DataStore Monitor -DatabaseServer $databaseserver -DatabaseName $databasenamemonitor -DatabaseCredentials \$databasecreds",
      provider  => powershell,
#     unless    =>  "Test-MonitorDBConnection -DBConnection", # Check if an existing site database exists on the database server    
  }
  
  Exec['Create New XenDesktop Site Database'] -> Exec['Create New XenDesktop Logging Database'] -> Exec['Create New XenDesktop Monitor Database']
  
  }