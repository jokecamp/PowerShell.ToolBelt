$servers = 'dc-npdtfe01', 'dc-npdtfe02'

foreach ($server in $servers) {
    Write-Host $server
    Get-Service  -ComputerName $server | Format-Table -AutoSize
}
