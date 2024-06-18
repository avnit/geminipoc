# Terraforms
<create>
  <summary> To create the infrastructure run the following commands in the following order </summary>    
  
  1. terraform init
  2. terraform validate
  3. terraform fmt
  4. terraform plan -out=tfplan -var envt=stage
  5. terraform apply tfplan
 
</create>
<destroy>
  <summary>To destroy the whole thing we can do this. </summary>
  
  1. terraform destroy -auto-approve -var envt=stage
</destroy>
<tfstate>
  <summary> TF State file is the most important file that terraform creates and this needs to be stored in safe and secured location. </summary> 
  <p> The tfstate file is stored in the GCP bucket of each project. The file is placed in the bucket with the same project name. The folder will be called terraform and then it is placed in the state folder. 
  </p>
</tfstate>

  
 
