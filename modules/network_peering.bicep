targetScope = 'subscription'

param parHubVnetName string
param parHubVnetResourceGroupName string

param parSpokeVnetName string
param parSpokeVnetResourceGroupName string

resource resRgHub 'Microsoft.Resources/resourceGroups@2023-07-01' existing = {
  name: parHubVnetResourceGroupName
}

resource resRgSpoke 'Microsoft.Resources/resourceGroups@2023-07-01' existing = {
  name: parSpokeVnetResourceGroupName
}

module modHubToSpokePeering 'network_peering_single.bicep' = {
  scope: resRgHub
  name: 'hubToSpokePeering-${parSpokeVnetName}'
  params: {
    parVnetName: parHubVnetName
    parPeeredVnetName: parSpokeVnetName
    parPeeredVnetResourceGroupName: parSpokeVnetResourceGroupName
    parVnetIsHub: true
  }
}

module modSpokeToHubPeering 'network_peering_single.bicep' = {
  scope: resRgSpoke
  name: 'spokeToHubPeering-${parHubVnetName}'
  dependsOn: [
    modHubToSpokePeering
  ]
  params: {
    parVnetName: parSpokeVnetName
    parPeeredVnetName: parHubVnetName
    parPeeredVnetResourceGroupName: parHubVnetResourceGroupName
    parVnetIsHub: false
  }
}
