# Citrix Xendesktop 7 Site Configuration

class citrix_xd7::site_configuration
(
  $databaseserver         = $citrix_xd7::databaseserver,
  $databasenamesite       = $citrix_xd7::databasenamesite,
  $databasenamelogging    = $citrix_xd7::databasenamelogging,
  $databasenamemonitor    = $citrix_xd7::databasenamemonitor,
  $xd7site                = $citrix_xd7::xd7site,
 )
{
  
  exec {'Create New XenDesktop Site':
      command   => "Import-Module 'C:/Program Files/Citrix/XenDesktopPoshSdk/Modules/Citrix.XenDesktop.Admin.V1/Citrix.XenDesktop.Admin';Add-PSSnapin Citrix.*;New-XDSite -SiteName $xd7site -DatabaseServer $databaseserver -LoggingDatabaseName $databasenamelogging -MonitorDatabaseName $databasenamemonitor -SiteDatabaseName $databasenamesite",
      provider  => powershell,
#     unless    => Get-ConfigSite contains $xd7site #Check if the site already exist
  }
}