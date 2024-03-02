<#Enter-PSSession assim como o Exit-PSSession são CMDLETS que eles só funcionam em uma sessão interativa do PowerShell,  
Uma sessão interativa do PowerShell é a sessão que a gente digita na console#>

function Add-applicationPool {
    param(
    [string[]] $computersname,
    [string] $applicationPoolName

    )

    $computersname | ForEach-Object {
            $session = New-PSSession -Computername $_ 
            Invoke-Command -Session $session -ScriptBlock {
                $appCmdArgs = "add apppool /name:$($args[0]) /managedRunTimeVersion:v4.0 /managedPipelineMode:Integrated"
            c:\windows\system32\inetsrv\appcmd.exe $appCmdArgs.Split(' ') 
            } -ArgumentList $applicationPoolName
            #substituir o <inetsrv> para o seu caminho no servidor
            #conforme a string tem espaços entre expressões, o powershell considera cada expressão 1 argumento add, apppool /names... 
            #para corrigir isso no powershell você deve utilizar o Split(' ')

    }    
}
