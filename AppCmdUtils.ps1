<#Enter-PSSession assim como o Exit-PSSession são CMDLETS que eles só funcionam em uma sessão interativa do PowerShell,  
Uma sessão interativa do PowerShell é a sessão que a gente digita na console#>

function Add-applicationPool {
    param(
    [string[]] $computersname,
    [string] $applicationPoolName

    )

    $computersname | ForEach-Object {
            Enter-PSSession -Computername $_ 

            $appCmdArgs = "add apppool /name:$applicationPoolName /managedRunTimeVersion:v4.0 /managedPipelineMode:Integrated"
            c:\windows\system32\inetsrv\appcmd.exe $appCmdArgs
            Exit-PSSession

            #substituir o <inetsrv> para o seu caminho no servidor

    }

}