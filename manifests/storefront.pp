# Citrix Xendesktop 7 Storefront Configuration

### NOT IMPLEMENTED ###

#class citrix_xd7::storefront
#(
#  # License Server Information
#  $licenseservername  = undef, # IP address or FQDN of the license server
#  $licenseserverport  = 27000, # TCP port used by the licensing server 
#  
#  # License Information
#  $productcode        = undef, # Citrix Product (Xendesktop, Xenapp, etc.)
#  $productedition     = undef, # Citrix Product Edition (Enterprise, Platinum, etc.)
#  $productversion     = undef, # Citrix Product Version Number (5,7,etc.)
#  $licensingmodel     = undef, # Citrix Licensing Type (User/Device or Concurrent)
#  
# 
#)
#{
#
#  exec {'Configure Xendesktop Licensing':
#      command   => "Set-ConfigSite -ProductCode $productcode -ProductEdition $productedition -ProductVersion $productversion -LicensingModel $licensingmodel -LicenseServerName $licenseservername -LicenseServerPort $licenseserverport",
#      provider  => powershell,
#     unless    =>     
#  }
#}