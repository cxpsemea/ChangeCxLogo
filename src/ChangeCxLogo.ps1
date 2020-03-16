<#
.SYNOPSIS
    Powershell Script to change Checkmarx Logo
.DESCRIPTION
    Powershell Script that changes Checkmarx Logo to a desired one
.PARAMETER Path
    The path to the .
.PARAMETER LiteralPath
    Specifies a path to one or more locations. Unlike Path, the value of
    LiteralPath is used exactly as it is typed. No characters are interpreted
    as wildcards. If the path includes escape characters, enclose it in single
    quotation marks. Single quotation marks tell Windows PowerShell not to
    interpret any characters as escape sequences.
#>
Param(
    # New Logo Path
    [Parameter(
        Position = 0,
        Mandatory = $true,
        HelpMessage = "New Logo Path"
    )][string] $newLogoPath,
    # Checkmarx Home Path
    [Parameter(
        Position = 1,
        Mandatory = $false,
        HelpMessage = "Checkmarx Home Path"
    )][string] $cxHome = "C:\Program Files\Checkmarx"
)

function pathExists($path){
    if(Test-Path $path){
        return $true
    } else {
        Write-Debug "Path ${path} does not exists"
        return $false
    }
}

function rename($from, $to){
    try{
        Rename-Item -Path $from -NewName $to
    } catch {
        Write-Warning "Unable to rename ${from} to ${to}"
    }
}

function copy($from, $to){
    try{
        Copy-Item -Path $from -NewName $to
    } catch {
        Write-Warning "Unable to copy ${from} to ${to}"
    }
}

if((pathExists $newLogoPath) -and (pathExists $cxHome)){
    $image1Path = "${cxHome}\CheckmarxWebPortal\Web\app\styles\images\checkmarx_logo.png"
    $image2Path = "${cxHome}\CheckmarxWebPortal\Web\Images\new-menu\checkmarx_logo.png"
    $date = Get-Date -Format "MM_dd_yyyy__HH_mm_ss"
    if(pathExists $image1Path){
        $renamed = rename $image1Path "checkmarx_logo_backup_${date}.png"
        $copied = copy $newLogoPath $image1Path
    } else {
        Write-Warning "Image Path ${image1Path} does not exists. New file created !"
        $copied = copy $newLogoPath $image1Path
    }
    if(pathExists $image2Path){
        $renamed = rename $image2Path "checkmarx_logo_backup_${date}.png"
        $copied = copy $newLogoPath $image2Path
    } else {
        Write-Warning "Image Path ${image2Path} does not exists. New file created !"
        $copied = copy $newLogoPath $image2Path
    }
}