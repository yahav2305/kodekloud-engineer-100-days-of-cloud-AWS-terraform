# kodekloud-engineer-100-days-of-cloud-AWS-terraform

Terraform code for completing KodeKloud Engineer [100 Days of Cloud](https://kodekloud.com/100-days-of-cloud) (AWS)

## Getting API access to the lab

The access key and secret access key can be found by running the following command in the lab terminal:

```sh
cat .aws/credentials
```

Make sure to put them in the correct folder for the stage under `creds.tfvars`.

## Running each stage

1. cd into the correct directory for the stage:

    ```sh
    cd day-<number>
    ```

1. Get the access key and secret access key by running the following command in the lab terminal:

    ```sh
    cat .aws/credentials
    ```

1. Put the credentials in `creds.tfvars`

1. Run terraform to provision the resources:

    ```sh
    tf apply
    ```
