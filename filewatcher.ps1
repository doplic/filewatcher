$sb={ 
     $name = $Event.SourceEventArgs.FullPath 
     $changeType = $Event.SourceEventArgs.ChangeType 
     $timeStamp = $Event.TimeGenerated 
     Write-Host "The file $name was $changeType at $timeStamp" -fore green
     Try{
     Copy-Item $name "c:\Output\"
      }
      Catch [system.exception]
      { Write-Host "caught a system exception trying to write $name which was $changeType at $timeStamp" -fore red } 
     $event 
}

$fsw=New-Object IO.FileSystemWatcher('c:\', '*.*')
$fsw.IncludeSubdirectories=$true
Register-ObjectEvent -InputObject $fsw -EventName Created -SourceIdentifier FileCreated1 -Action $sb
