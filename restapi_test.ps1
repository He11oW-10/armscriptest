$username = ""      # service principal aad app id
$secret=""          # service principal secret
$tenantId=""
$subsid=""          # subscription id
$rsc_group=""       # resource group name 
$funcapp_name=""    # function app name

$body=@{grant_type='client_credentials'
        client_id=$username
        client_secret=$secret
        resource='https://management.azure.com'
}

$response=Invoke-RestMethod -Uri https://login.microsoftonline.com/$tenantId/oauth2/token -Headers @{'Content-Type'='application/x-www-form-urlencoded'} -Body $body -Method 'Post'
$token=$response.access_token

$headers2=@{'Authorization'='Bearer '+$token}
$function_key=Invoke-RestMethod -Uri https://management.azure.com/subscriptions/$subsid/resourceGroups/$rsc_group/providers/Microsoft.Web/sites/$funcapp_name/host/default/listkeys?api-version=2019-08-01 -Headers $headers2 -Method 'Post'
$function_key.masterKey
