param(
    [Parameter(Mandatory=$true)]
    [string] $ResourceGroupName,

    [Parameter(Mandatory=$true)]
    [string] $IntegrationAccountName,

    [Parameter(Mandatory=$true)]
    [string] $MapName,

    [Parameter(Mandatory=$true)]
    [string] $MapFileName
)

$childPath = Join-Path $ENV:RELEASE_PRIMARYARTIFACTSOURCEALIAS -ChildPath ("drop\{0}" -f $MapFileName)
$MapFileFullPath = Join-Path -Path $ENV:SYSTEM_DEFAULTWORKINGDIRECTORY -ChildPath $childPath

Get-AzIntegrationAccountMap -ResourceGroupName $ResourceGroupName -Name $IntegrationAccountName -MapName $MapName -ErrorAction SilentlyContinue

if($?) {
    Set-AzIntegrationAccountMap -Name $IntegrationAccountName `
        -ResourceGroupName $ResourceGroupName `
        -MapName $MapName `
        -MapFilePath $MapFileFullPath -Confirm:$false -Verbose
}
else {
    New-AzIntegrationAccountMap -Name $IntegrationAccountName `
        -ResourceGroupName $ResourceGroupName `
        -MapName $MapName `
        -MapFilePath $MapFileFullPath -Confirm:$false -Verbose
}