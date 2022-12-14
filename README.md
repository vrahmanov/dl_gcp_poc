# dl_gcp_poc - WIP

short terraform module to deploy gke on gcp with sub network layer,  
deploying namespaces - services , monitoring , mongo , rabitmq

deploying base charts - mongo , rabitmq, promstack 

## Requirements


```bash
terraform >=1.0
helm = lts
gcloud cli ( auth token pregenerated ) 
kubectl 

```

## Usage

```terraform 
terraform fmt
terraform validate
terraform init 
terraform plan 
terraform apply  -> required var.project_id
  
The project ID to host the cluster in

  Enter a value: XXXXXX-asdasd-environment


```

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

Please make sure to update tests as appropriate. ( currently NONE ) 

## License

None