function Git ($URI,$CurrentDir)
{
	$CurrentDir='C:\Users\Host\Downloads\YABTR-master\YABTR-master'
    $GitName = $URI[0].trimend('/').split('/')[-1] -replace "\.zip$", ''
    #Invoke-WebRequest -Uri $URI+"/archive/master.zip" -OutFile $CurrentDir+"\"+$GitName+"\master.zip"
	mkdir $CurrentDir"\Windows_Toolbox\"$GitName -force
	(New-Object System.Net.WebClient).DownloadFile($URI[0]+"/archive/master.zip",$CurrentDir+"\Windows_Toolbox\"+$GitName+"\master.zip")
}

function DownloadFromWeb ($URI,$CurrentDir)
{
	$CurrentDir='C:\Users\Host\Downloads\YABTR-master\YABTR-master'
    $FielName = $URI.trimend('/').split('/')
    (New-Object System.Net.WebClient).DownloadFile($URI[0],$CurrentDir+"\"+$FielName)
}

foreach($line in Get-Content 'C:\Users\Host\Downloads\YABTR-master\YABTR-master\Lists\Windows.txt') {
    $CurrentDir='C:\Users\Host\Downloads\YABTR-master\YABTR-master'
    if ($line -like '*github.com*')
    {
    Git ($line,$CurrentDir)
    }
    else
    {
    DownloadFromWeb ($line,$CurrentDir)
    }
}
