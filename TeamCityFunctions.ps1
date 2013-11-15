<#
    Uses guest access to get the lastest successful build for a given project (project id is bt30)

    Guest Access needs to be enabled on TeamCity server or you will need to provide your
    own authentication.


    Example usage:
        Get-Latest-TeamCity-Build "http://dc-devutil01/ "bt30" | Write-Output 

#>
Function Get-Latest-TeamCity-Build([string]$teamCityBaseUrl, [string]$projectId) {

    $url = "${teamCityBaseUrl}guestAuth/app/rest/buildTypes/id:${projectId}/builds?status=SUCCESS"

    $xml = [xml](invoke-RestMethod -Uri $url -Method GET)
    $xpath = "/builds/build[1]"
    $latestBuild = Select-xml -xpath $xpath -xml $xml

    return @{
        "Build" = $latestBuild.Node.GetAttribute("id"); 
        "Revision" = $latestBuild.Node.GetAttribute("number"); 
        "Url" = $url
        }
}

Get-Latest-TeamCity-Build "http://dc-devutil01/" "bt30" | Write-Output 