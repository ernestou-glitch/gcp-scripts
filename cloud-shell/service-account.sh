#Enable  APIs requiered to add IAM roles to members
gcloud services enable cloudresourcemanager.googleapis.com
gcloud services enable iam.googleapis.com

#Create initial Terraform SA
gcloud iam service-accounts create setup-sa --description="SA to setup project and create multiple SA with custom roles" --display-name="setup-sa" --project=$PROJECT_ID

# Binding roles to initial SA
#*IAM command only accepts 1 role per gcloud command, for multiple roles you have to make multiple calls

gcloud projects add-iam-policy-binding $PROJECT_ID --member serviceAccount:setup-sa@$PROJECT_ID.iam.gserviceaccount.com --role roles/iam.serviceAccountAdmin

gcloud projects add-iam-policy-binding $PROJECT_ID --member serviceAccount:setup-sa@$PROJECT_ID.iam.gserviceaccount.com --role roles/iam.roleAdmin

gcloud projects add-iam-policy-binding $PROJECT_ID --member serviceAccount:setup-sa@$PROJECT_ID.iam.gserviceaccount.com --role roles/resourcemanager.projectIamAdmin

#Download SA key to cloud shell
gcloud iam service-accounts keys create --iam-account=setup-sa@$PROJECT_ID.iam.gserviceaccount.com --project=$PROJECT_ID secret.json

#Download key to your workstation
cloudshell download secret.json

#Delete SA when done configuring project
# https://cloud.google.com/sdk/gcloud/reference/iam/service-accounts/delete

#gcloud iam service-accounts delete setup-sa@$PROJECT_ID.iam.gserviceaccount.com --project=$PROJECT_ID
