$instanceName = "instance-1" #name of the instance

$instanceMetadata = gcloud compute instances describe $instanceName --format json

$jsonString = ConvertTo-Json $instanceMetadata

Write-Output $jsonString