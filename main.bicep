
var appServicePlanName = 'toylaunchsamk2105bcp-plan'
   
   resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
      name: 'toylaunchsamk2105bcp'
      location: 'belgiumcentral'
      sku: {
        name: 'Standard_LRS'
      }
      kind: 'StorageV2'
      properties: {
        accessTier: 'Hot'
      }
    }

    resource appservicePlan 'Microsoft.Web/serverfarms@2024-04-01' = {
      name: appServicePlanName
      //location: 'belgiumcentral'
      location: resourceGroup().location
      sku: {
        name: 'B1'
      }
      properties: {
        reserved: false
      }
    }

    resource appServiceApp 'Microsoft.Web/sites@2024-04-01' = {
      name: 'toylaunchsamk2105bcp-app'
      location: resourceGroup().location
      properties: {
        serverFarmId: appservicePlan.id
        httpsOnly: true
      }
    }
