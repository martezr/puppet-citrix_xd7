#citrix_xd7

####Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with citrix_xd7](#setup)
    * [What citrix_xd7 affects](#what-[modulename]-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with citrix_xd7](#beginning-with-[Modulename])
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

##Overview

Install Citrix Xendesktop 7

##Module Description

The module automates the Citrix Xendesktop 7 installation

##Setup

###What citrix_xd7 affects

The module utilizes paramaters provided by the Citrix Xendesktop 7 installer

###Setup Requirements
 
 - The User Account Control (UAC) feature needs to be disabled prior to the installation for the windows powershell operation to work properly
 - The .Net FrameWork 3.5 feature is a requirement of the Citrix Xendesktop installer
 
Depends on the following modules:

[puppetlabs/stdlib](https://forge.puppetlabs.com/puppetlabs/stdlib)

[joshcooper/powershell](https://forge.puppetlabs.com/joshcooper/powershell)

##Usage

Class: citrix_xd7

Example - Install Xendesktop 7 delivery controller and desktop from a network share 

<pre>
class {'citrix_xd7':
   source 		   => '//server01.test.local/shared/xendesktop7/' 
   controller      => true,
   desktopstudio   => true,
   licenseserver   => false,
   desktopdirector => false,
   storefront      => false,
   sql             => false,
  }
</pre>

Parameters:
  $source:: The location of the Xendesktop 7 installation files. 
     Defaults to D:\x64\XenDesktop Setup which is the installation location on the DVD media.
     Valid values: Network Share - '//server/networkshare/xendesktop/'

  $sql:: The setting determines whether the included version of SQL Server 2012 is installed as part of the installation.
     Default value: true (install SQL as part of the installation) 
     Valid values: true and false

  $controller:: The setting determines whether the delivery controller component will be installed.
      Default value: true (install the delivery controller as part of the installation)
      Valid values: true or false

  $desktopstudio:: The setting determines whether the desktop studio component will be installed.
      Default value: true (install desktop studio as part of the installation)
      Valid values: true or false

  $licenseserver:: The setting determines whether the license server component will be installed.
      Default value: true (install the license server as part of the installation)
      Valid values: true or false

  $desktopdirector:: The setting determines whether the desktop director component will be installed.
      Default value: true (install desktop director as part of the installation)
      Valid values: true or false

  $storefront:: The setting determine whether the store front component will be installed.
      Default value: true (install store front as part of the installation)
      Valid values: true or false
  

##Reference

##Limitations

Supported on Windows Server 2008R2 and Server 2012

##Development

##Release Notes/Contributors/Etc

Contributors:

Martez Reed <martez.reed@greenreedtech.com>
