$instanceName = "instance-1"
$instanceMetadata = gcloud compute instances describe $instanceName --format json

$jsonString = ConvertTo-Json $instanceMetadata

Write-Output $jsonString
