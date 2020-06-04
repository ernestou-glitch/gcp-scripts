# Installation Guide for Windows and Linux

1) Download Terraform for your OS
https://www.terraform.io/downloads.html

2) Extract binary

3) Add binary to PATH environment variable

**Video: https://learn.hashicorp.com/terraform/getting-started/install.html**

## Ubuntu 20.04 Example

``sudo apt-get update -y``

``sudo apt install -y zip unzip vim``

``wget https://releases.hashicorp.com/terraform/0.12.26/terraform_0.12.26_linux_amd64.zip``

``unzip terraform_0.12.26_linux_amd64.zip``

``mkdir -p ~/bin``

``mv terraform ~/bin/ ``

``echo "export PATH=\"$PATH:~/bin\"" >> ~/.profile``

## Setup Terraform for GCP provider and authenticate via a Service Account

Preferable method to authenticate is via a Service Account and store the path to the JSON file in your user profile file rather than include it in your code.

1) [Create a Service Account](https://cloud.google.com/iam/docs/creating-managing-service-accounts#creating) in your project.

2) [Add a Role](https://cloud.google.com/iam/docs/granting-roles-to-service-accounts#granting_access_to_a_service_account_for_a_resource) to your Service Account.

3. [Download](https://cloud.google.com/iam/docs/creating-managing-service-account-keys#creating_service_account_keys) the Service Account Key and upload it into your server.

Create a **main.tf** with the following content

``provider "google" {``

``project = "{{YOUR GCP PROJECT}}"``
  
``region  = "us-central1"``
  
``zone    = "us-central1-c"``
  
``}``

4. Add the path of your JSON file to your profile file as variable **GOOGLE_APPLICATION_CREDENTIALS**

``echo "export GOOGLE_APPLICATION_CREDENTIALS={{path}}" >> ~/.profile``

5. Run terraform init to download google provider plugin


``terraform init``

6. **Enjoy**
