// should not flag an existing resource for any check
resource storageAccountExisting 'Microsoft.Storage/storageAccounts@2021-08-01' existing = {
  name: 'existing'
}

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-08-01' = {
  name: 'new'
}

resource serverDefault 'Microsoft.Sql/servers@2021-02-01-preview' = {
  name: 'default'
  location: resourceGroup().location

  properties: {
    administratorLogin: sqlLogicalServer.userName
    administratorLoginPassword: password
    version: '12.0'
    minimalTlsVersion: sqlLogicalServer.minimalTlsVersion
    publicNetworkAccess: sqlLogicalServer.publicNetworkAccess
  }

  resource childDefault 'auditingSettings' = {
    name: 'default'

    properties: {
      isAzureMonitorTargetEnabled: true
    }
  }
}