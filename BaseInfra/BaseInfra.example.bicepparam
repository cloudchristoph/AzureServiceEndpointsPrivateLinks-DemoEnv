using './BaseInfra.bicep'

param parLocation = 'westeurope'
param parTags = {
  Owner: 'CloudChristoph'
  Project: 'FestiveTechCalendar2023'
}
param parResourceBaseName = 'cloudfamily'

param parVnetAddressPrefix = '10.2.0.0/16'
param parLocalVpnAddressPrefix = '<your-on-prem-ip-cidr>'
param parLocalVpnGatewayIp = '<your-on-prem-ip>'

param parAdminUsername = readEnvironmentVariable('ADMIN_USERNAME', '<your-default-admin-username>')
param parAdminPassword = readEnvironmentVariable('ADMIN_PASSWORD', '<your-default-admin-password>')

