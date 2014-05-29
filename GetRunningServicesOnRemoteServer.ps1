$servers = 'server1', 'server2'

foreach ($server in $servers) {
    Write-Host $server
    Get-Service  -ComputerName $server | Format-Table -AutoSize
}
