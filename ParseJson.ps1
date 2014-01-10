<# Read Json - via http://stackoverflow.com/a/17602226/215502 #>

[System.Reflection.Assembly]::LoadWithPartialName("System.Web.Extensions")
$json = "{a:1,b:2,c:{nested:true}}"
$ser = New-Object System.Web.Script.Serialization.JavaScriptSerializer
$obj = $ser.DeserializeObject($json)
write-output $obj