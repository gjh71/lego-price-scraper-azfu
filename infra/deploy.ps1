Connect-AzAccount 

$resourceGroupName = "YourResourceGroupName"
$location = "YourLocation"
$templateFile = Join-Path $PSScriptRoot -ChildPath "main.bicep"

$rg = get-azresourcegroup -name $resourceGroupName -erroraction silentignore
if ($null -eq $rg){
    $rg = New-AzResourceGroup -Name $resourceGroupName -Location $location
}

# Deploy the Bicep file
$result = New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile $templateFile
$result
