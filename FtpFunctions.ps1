<#
    - Creates an FTP site in IIS
    - Enabled Basic Authentication
    - Restarts FTP sites

    Resources:
    http://technet.microsoft.com/en-us/library/ee790579.aspx
    http://balamurugankailasam.blogspot.com/2012/10/creating-ftp-site-map-ftp-folder-and.html

    physical NIB
    iis manager permissions
    Allow All Users Read,Write
    Basic Auth enabled
    Anon Auth enabled


    Example usage: 
        SetupFtpSite 'DropZone', 'E:\Shares\ftp', 'NewsFlexFtpUser'
#>
Function SetupFtpSite ([String]$ftpName, [String]$PhysicalPath, [String]$user)
{
    New-WebFtpSite -Name $ftpName -PhysicalPath $PhysicalPath
    Set-ItemProperty "IIS:\Sites\${ftpName}" -Name ftpServer.security.authentication.basicAuthentication.enabled -Value $true
    

    #Set the permissions...
    Add-WebConfiguration -Filter /System.FtpServer/Security/Authorization -Value (@{AccessType="Allow"; Users="${user}"; Permissions="Read, Write"}) -PSPath IIS: -Location $ftpName
    
    Restart-WebItem "IIS:\Sites\${ftpName}"
}

