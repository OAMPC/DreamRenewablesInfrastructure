# Dream Renewables Infrastructure

## Contents

- [About This Project](#about-this-project)
- [Setup](#setup)
  - [Requirements](#requirements)
    - [Cloud Providers](#cloud-providers)
      - [Heroku](#heroku)
      - [AWS](#aws)
    - [Installing Project Dependencies](#installing-project-dependencies)
- [Usage](#usage)
  - [Running the Iac](#running-the-iac)
- [Further documentation](#further-documentation)
  - [Related Repositories](#related-repositories)

## About This Project

This is the Repo/Code for the infrastructure required to run the [Dream Renewables Web Application](https://dream-renewables-frontend-87a62514598b.herokuapp.com/). This application primarily utilises the following technologies:

- [Terraform](https://www.terraform.io/)
- [Heroku](https://www.heroku.com/about)
- [AWS](https://aws.amazon.com/)

Terraform requires state locking which for larger projects requires a DB to manage to ensure there is not overwriting. As this is run by only a few devs this unnecessary and can be managed with good communication i.e not making changes to the terraform at the same time.

## Setup

### Requirements

This project requires the following pre-requisites:

1. [Terraform](https://www.terraform.io/)
2. [NodeJs](https://nodejs.org/en)
3. [AWS-Vault](https://github.com/99designs/aws-vault)

#### Cloud Providers

##### Heroku

- In order to locally make changes to Heroku you'll need to authorize with Heroku. When logged in as the Heroku admin the following command will show you a already made authorization token
  - `heroku authorizations` - will show authorizations, there should be one called `terraform-dream-renewables-website`
  - `heroku authorizations:info <ID>` - will show data on a specified authorization
  - `export HEROKU_API_KEY=<TOKEN> HEROKU_EMAIL=<EMAIL>` - This will set the keys in order for you to make usual terraform commands

##### AWS

- In order to locally make changes to AWS you'll need to assume the credentials of the terraform-client.
  1. If not already installed setup aws vault via their installing documentation for installation on windows I'd recommend using chocolatey and for mac i'd recommend using HomebrewCask
  2. Add the terraform-client to your aws-vault: `aws-vault add terraform-client`

#### Installing project dependencies

This project uses [Husky](https://typicode.github.io/husky/) and [lint-staged](https://www.npmjs.com/package/lint-staged/v/12.3.2) to enforce consistent formatting of Terraform files using `terraform fmt` before committing changes.

1. In the root directory Install dependencies: `npm i`
2. The pre-commit file _.husky/pre-commit_ should contain the following line only: `npx lint-staged`
   - The subfolder _.husky/_\_ is required and should *not* be committed by default
3. Ensure the pre-commit file is executable: `chmod +x .husky/pre-commit`

## Usage

### Running the IaC

To run the application you must ensure you've followed the setup steps

- Cloned the repo
- Navigated to the terraform directory you want to work on as this project uses several terraform states to manage each system in the overall web application
- If necessary initialise the provider: `terraform init`
- If you are working in a directory which has aws as a provider you will need to run the commands with aws-vault terraform-client. This can be done by starting a subshell with temporary credentials: `aws-vault exec terraform-client` or by prefixing the below commands with `aws-vault exec terraform-client --` for example `aws-vault exec terraform-client -- terraform plan`
- Review the terraform plan and ensure nothing is irregular. If terraform is looking to create pre-existing resources you made need to import pre-existing infrastructure.
  This can be done with the following command: `terraform import <resource_type>.<resource_name_in_tf_file> <existing_infrastructure_identifier>`

## Further documentation

### Related Repositories

| Name                                                                          | Description                                            |
| :---------------------------------------------------------------------------- | :----------------------------------------------------- |
| [Dream Renewables Cms](https://github.com/OAMPC/DreamRenewablesCms)           | The Content Management System for this web application |
| [Dream Renewables Frontend](https://github.com/OAMPC/DreamRenewablesFrontend) | React code for this web application                    |
