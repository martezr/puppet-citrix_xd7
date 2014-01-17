# Citrix Xendesktop 7 License Server Configuration

class citrix_xd7::licensing
(
  # License Server Information
  $licenseservername  = $citrix_xd7::licenseservername, # IP address or FQDN of the license server
  $licenseserverport  = $citrix_xd7::licenseserverport, # TCP port used by the licensing server 
  
  # License Information
  $productcode        = $citrix_xd7::productcode, # Citrix Product (Xendesktop, Xenapp, etc.)
  $productedition     = $citrix_xd7::productedition, # Citrix Product Edition (Enterprise, Platinum, etc.)
  $productversion     = $citrix_xd7::productversion, # Citrix Product Version Number (5,7,etc.)
  $licensingmodel     = $citrix_xd7::licensingmodel, # Citrix Licensing Type (User/Device or Concurrent)
  
 
)
{

  exec {'Configure Xendesktop Licensing':
      command   => "Import-Module 'C:/Program Files/Citrix/XenDesktopPoshSdk/Modules/Citrix.XenDesktop.Admin.V1/Citrix.XenDesktop.Admin';Set-ConfigSite -ProductCode $productcode -ProductEdition $productedition -ProductVersion $productversion -LicensingModel $licensingmodel -LicenseServerName $licenseservername -LicenseServerPort $licenseserverport",
      provider  => powershell,
#     unless    =>     
       }
                                         
}