# travis-terraform-dockerfile
Travis CI + Terraform Dockerfile 

```yaml

# Plan only on pull requests, Apply on merged code

dist: xenial
language: minimal

jobs:
  include:
    - stage: terraform plan
      # Only run `terraform validate` and plan state if within a pull request
      if: type IN (pull_request)
      script:
        - echo "Executing Terraform Plan on pull request code"
        - terraform init $tf_init_cli_options
        - terraform validate $tf_validation_cli_options
        - terraform plan $tf_plan_cli_options
        - terraform graph | dot -Tsvg > Montana.svg
    - stage: terraform apply
      # Only run terraform apply stage if outside of a pull request
      if: type IN (push) and branch = master
      script:
        - echo "Executing Terraform Apply on merged code"
        - terraform init $tf_init_cli_options
        - terraform apply $tf_apply_cli_options
    - stage: destroy
      # Only run terraform apply stage if outside of a pull request
      if: type IN (push) and branch = master
      script:
        - terraform destroy
  ```
