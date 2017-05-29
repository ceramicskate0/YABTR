param{
$URI=https://github.com/ceramicskate0/YAKSR
}
$CurrentDir=Pwd

if($Name -match "^[a-zA-Z0-9]+/[a-zA-Z0-9_-]+$")
{
    $Name = "https://github.com/$Name.zip"
}
$GitName = $Name.trimend('/').split('/')[-1] -replace "\.zip$", ''
$Target = $Dependency.Target
if(-not $Target)
{
    $Target = $PWD.Path
}
$RepoPath = Join-Path $Target $GitName

Invoke-WebRequest -Uri $URI+"/archive/master.zip" -OutFile $CurrentDir+"\"+$RepoPath
