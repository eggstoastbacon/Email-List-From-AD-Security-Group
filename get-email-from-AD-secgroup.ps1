$gname = read-host "Enter Security Group Name"
$mails = @()
$mails = Get-ADGroupMember -Identity $gname -Recursive | 
Get-ADUser -Properties Mail | 
Select-Object Mail
$list = @()
foreach($mail in $mails){
$list += ($mail.mail + ";")}

$stringlist = $list -replace "`n",", " -replace "`r",", " 
$stringlist = [string]::join("",($list.Split("`n")))
$stringlist = $stringlist.Substring(0,$stringlist.Length-1)

Write-Host "`n"
$stringlist
Write-Host "`n"
Read-host "Press Any Key to Exit."
