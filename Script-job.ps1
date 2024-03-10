#Comandos Powershell
 
$computer | ForEach-Object {
    install-windowsfeatures -name "web-server" -ComputerName $_ }
    
    
    #or
    
    $server | ForEach-Object {
    install-windowsfeatures -ComputerName $_ -name "web-server" }
    
    <# criação de variavel e atribuir um valor com "range" de 1 até 10 ou até mais.#>
    
     $computer = 1..10 | ForEach-Object {"SRV$_"}
     $computer
   SRV1
   SRV2
   SRV3
   SRV4
   SRV5
   SRV6
   SRV7
   SRV8
   SRV9
   SRV10
   
   # para executar um tipo de "job" que vai ser realizado em vários servidor um job de instalação ou manutenção de uma só vez. é necessário usar o start-job #
   
   $computer | ForEach-Object { 
    $computer = $_	
    start-job -scriptblock { 
    install-windowsfeatures -name web-websocket -ComputerName $computer }
   }
   
   <# Pergunta 
    Com o isolamento existente entre nossa sessão no PowerShell e os Jobs criados, o script de um job não pode acessar variáveis fora de seu escopo.
    R: Graças ao isolamento criado pelo PowerShell, nossa sessão e nossas variáveis são protegidas e inacessíveis aos scripts executados por um job. #>
    