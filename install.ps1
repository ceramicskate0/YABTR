function Git ($URI,$CurrentDir)
{
	$CurrentDir=(Get-Item -Path ".\").FullName
    $GitName = $URI[0].trimend('/').split('/')[-1] -replace "\.zip$", ''
    #Invoke-WebRequest -Uri $URI+"/archive/master.zip" -OutFile $CurrentDir+"\"+$GitName+"\master.zip"
	mkdir $CurrentDir"\Windows_Toolbox\"$GitName -force
	(New-Object System.Net.WebClient).DownloadFile($URI[0]+"/archive/master.zip",$CurrentDir+"\Windows_Toolbox\"+$GitName+"\master.zip")
}

function DownloadFromWeb ($URI,$CurrentDir)
{
	$CurrentDir=(Get-Item -Path ".\").FullName
    $FielName = $URI.trimend('/').split('/')
    (New-Object System.Net.WebClient).DownloadFile($URI[0],$CurrentDir+"\"+$FielName)
}

foreach($line in Get-Content (Get-Item -Path ".\").FullName+'Windows.txt') {
    $CurrentDir=Get-Location
    if ($line -like '*github.com*')
    {
    Git ($line,$CurrentDir)
    }
    else
    {
    DownloadFromWeb ($line,$CurrentDir)
    }
}
