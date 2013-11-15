PowerShell.ToolBelt
===================

by Joe Kampschmidt

A various collection of powershell scripts to aid a devops engineer. Some examples are very specific. They should be used as a demonstration on what is possible.

Table of Contents

- FTP Functions
 - SetupFtpSite - Creates an FTP Site in IIS, enables basic authentication. Adds Read/Write access to provided user and then restarts the FTP website.
- Network Share Functions
 - Get-AllShares - list all existing network shares on running computer
 - Create-ShareWithAnonFullControl - creates a physical directory and then shows how to give FullControl to an Anonymous user.
- TeamCity Functions
 - Get-Latest-TeamCity-Build - connects to TeamCity Rest API plugin through Guest access and finds the last successful build for a given project id.