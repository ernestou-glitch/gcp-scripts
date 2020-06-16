# Terraform works on folder level so it knows will search for important files such as provider.tf or variable.tf in the same folder where main.tf is located
# https://www.terraform.io/docs/configuration/variables.html

variable "path" {default = "/home....."}
variable "project_id" {default = "xxxxxxxxx"}
variable "region" {default = "us-central1"}
variable "zone" {default = "us-central1-a"}

variable "name" { default = "first-job"}
variable "template_path" {default = "gs://dataflow-templates/latest/Word_Count"}
variable "temp_dir" {default = "gs://bucket-name/tmp"}

#Optional parameters
# variable "service_account_email" {default = "service_account@email.com"} 
# variable "network" {default = "default"} 
# variable "subnetwork" {default = "regions/REGION/subnetworks/SUBNETWORK"} 
# variable "machine_type" {default = n1-standard-1} 
# variable "max_workers" {default = 1} 
# variable "additional_experiments" {default = ["enable_stackdriver_agent_metrics"]} 

#Dataflow Template parameters, example for WordCount Template
#https://cloud.google.com/dataflow/docs/guides/templates/provided-templates#wordcount

variable "input" {default = "gs://bucket-name/inputfile"}
variable "output" {default = "gs://bucket-name/outputfile"}

