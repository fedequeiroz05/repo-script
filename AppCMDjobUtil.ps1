
#Script para executar o comando de instalacao de applicationpool no servidor IIS em modo paralelo.
function Add-applicationPool {
    param(
        [string[]] $computername,
        [string] $applicationPoolName
    )

    $session = $computername | ForEach-Object { New-PSSession -ComputerName $_}
    $jobs = $session | ForEach-Object {
        Invoke-Command -Session $_ -ScriptBlock {
            $appCmdArgs = "add apppool /name:$($args[0]) /managedRunTimeVersion:v4.0 /managedPipelineMode:Integrated"
        c:\windows\system32\inetsrv\appcmd.exe $appCmdArgs.Split(' ') 
        } -ArgumentList $applicationPoolName -AsJob
    }
    #substituir o caminho c:\windows\system32\inetsrv\appcmd.exe para o seu caminho local

    $jobs | Wait-Job | Select-Object @{Expression={ receive-job $_ };Label="resultado"},"Name"
    $jobs | Remove-Job
    $session | Remove-PSSession

}
