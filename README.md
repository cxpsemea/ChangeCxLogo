# ChangeCxLogo

Powershell Script to change Checkmarx Logo.

This script will take an image from the input and it will replace in the 2 following folders the icon presented in Checkmarx:

- \<CHECKMARX_HOME>\CheckmarxWebPortal\Web\app\styles\images\checkmarx_logo.png
- \<CHECKMARX_HOME>\CheckmarxWebPortal\Web\Images\new-menu\checkmarx_logo.png

A backup of these 2 icons will be created for future reference with format in the same folders:
- checkmarx_logo{_backup_MM_dd_yyyy__HH_mm_ss}.png

After the run of the script you just need to clean refresh the Checkmarx Portal Page in Browser and you will start to see the new icon in the top-left-corner.

Note: Please assure your new icon have the same dimensions as the original Checkmarx Icon.

# Inputs

- -newLogoPath \<Path> - Example: C:\Users\Admin\Desktop\mylogo.png - * Required
- -cxHome \<Path> - Example/Default: C:\Program Files\Checkmarx - Optional

# Help

```cmd
Get-Help .\ChangeCxLogo.ps1 -Detailed

NAME
    .\ChangeCxLogo.ps1
    
SYNOPSIS
    Powershell Script to change Checkmarx Logo
    
    
SYNTAX
    .\ChangeCxLogo.ps1 [-newLogoPath] <String> [[-cxHome] <String>] [<CommonParameters>]
    
    
DESCRIPTION
    Powershell Script that changes Checkmarx Logo to a desired one
    

PARAMETERS
    -newLogoPath <String>
        New Logo Path
        
    -cxHome <String>
        Checkmarx Home Path - Default: C:\Program Files\Checkmarx
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
REMARKS
    To see the examples, type: "get-help .\ChangeCxLogo.ps1 -examples".
    For more information, type: "get-help .\ChangeCxLogo.ps1 -detailed".
    For technical information, type: "get-help .\ChangeCxLogo.ps1 -full".
```

### Before

Portal

<img src="images/beforePortal.png" >

### After

Portal

<img src="images/afterPortal.png" >

Folder \<CHECKMARX_HOME>\CheckmarxWebPortal\Web\Images\new-menu\checkmarx_logo.png

<img src="images/afterFolder1.png" >

Folder \<CHECKMARX_HOME>\CheckmarxWebPortal\Web\app\styles\images\checkmarx_logo.png

<img src="images/afterFolder2.png" >

# License

MIT License

Copyright (c) 2020 CX PS EMEA