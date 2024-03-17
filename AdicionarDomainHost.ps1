


$hostname = Read-Host -Prompt 'Favor inserir o hostname ou IP do computador a ser inserido no dominio'
if (Test-Connection $hostname -Count 1) {
    Write-Host -ForegroundColor Green "Conectado ao computador $hostname !!"
$userLocal = Read-Host 'Insira o nome do user local. localadmin.vli ou Administrador'
 
 
$userDominio = Read-Host  'Favor digitar sua matricula'
$prefixo = "DOMAIN\" + "$UserDominio" 
Add-Computer -ComputerName $hostname -LocalCredential $userLocal -DomainName DOMAIN -Credential $prefixo  -Restart 
pause
 
  } else { 
   Write-host -Foreground red "Impossivel conectar ao computador $hostname, favor verificar se o mesmo esta conectado a rede corretamente!!" 
    } 
    pause