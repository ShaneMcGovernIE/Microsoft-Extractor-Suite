$JSON = Get-Content -Raw -Path '.\SignInLogs.json' | ConvertFrom-Json

$JSON | Select-Object -Property @{
    Name       = 'Created'
    Expression = { $_.CreatedDateTime }
}, @{
    Name       = 'Output'
    Expression = { $_.Status.AdditionalDetails }
}, @{
    Name       = 'Name'
    Expression = { $_.UserDisplayName }
}, @{
    Name       = 'Email'
    Expression = { $_.UserPrincipalName }
}, @{
    Name       = 'Location'
    Expression = { $_.Location.State }
}, @{
    Name       = 'Status'
    Expression = { $_.ConditionalAccessStatus }
}, @{
    Name       = 'Application'
    Expression = { $_.AppDisplayName }
}, IpAddress, @{
    Name       = 'Device'
    Expression = { $_.ClientAppUsed }
} | Out-HtmlView
