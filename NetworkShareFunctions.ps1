<#
    Creates the folder for a network share if it does not exist yet
    and gives FullControl to the "ANONYMOUS LOGON"

    Example usage: 
        Create-ShareWithAnonFullControl 'E:\Shares' 'Shares'
#>
Function Create-ShareWithAnonFullControl ([String]$FullPath, [String]$ShareName)
{
    #alias the command
    $Shares=[WMICLASS]'WIN32_Share'

    IF (!(TEST-PATH $FullPath)) {
        New-Item -type directory -Path $FullPath
    }

    $Shares.Create($FullPath,$ShareName,0)
    $Acl = Get-Acl $FullPath
    $Ar = New-Object system.security.accesscontrol.filesystemaccessrule('ANONYMOUS LOGON','FullControl','ContainerInherit, ObjectInherit', 'None', 'Allow')
    $Acl.AddAccessRule($Ar)
    Set-Acl $FullPath $Acl
}


<# 
    List all the existing shares on this computer. This is useful to verify 
    the shares you have created.

    Example usage:
        Get-AllShares
#>
Function Get-AllShares {
    GWMI win32_share | ft name, path, description -auto
}
