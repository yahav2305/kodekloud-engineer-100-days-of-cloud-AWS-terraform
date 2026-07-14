# How to run

1. In the lab terminal run the following command with default parameters:

    ```sh
    ssh-keygen
    ```

    Then copy `/root/.ssh/id_rsa.pub` from the lab terminal to `terraform.tfvars` in `ssh_pub_key`.

1. In the lab terminal run the following command:

    ```sh
    curl -s ip-api.com/line/?fields=query
    ```

    Then copy the IP address to `terraform.tfvars` in `lab_host_ip`.

1. After running `terraform apply`, the public IP of the instance will be in the output. Connect from the lab terminal with the command `ssh -i .ssh/id_rsa root@<instance-public-ip>` to make sure that the instance is accessible.
