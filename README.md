# Dream Renewables Infrastructure

## Contents

- [About This Project](#about-this-project)
- [Setup](#setup)
  - [Requirements](#requirements)
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

- In order to locally make changes to Heroku you'll need to authorize with Heroku. When logged in as the Heroku admin the following command will show you a already made authorization token
  - `heroku authorizations` - will show authorizations, there should be one called `terraform-dream-renewables-website`
  - `heroku authorizations:info <ID>` - will show data on a specified authorization
  - `export HEROKU_API_KEY=<TOKEN> HEROKU_EMAIL=<EMAIL>` - This will set the keys in order for you to make usual terraform commands

## Usage

### Running the IaC

To run the application you must ensure you've followed the setup steps

- Cloned the repo
- Navigated to the terraform directory you want to work on as this project uses several terraform states to manage each system in the overall web application
  - If necessary initialise the provider: `terraform init`
  - Update/Create your terraform and run: `terraform plan`
    - Review the terraform plan and ensure nothing is irregular. If terraform is looking to create pre-existing resources you made need to import pre-existing infrastructure.
      This can be done with the following command: `terraform import <resource_type>.<resource_name_in_tf_file> <existing_infrastructure_identifier>`
  - If you're happy with the changes run the command: `terraform apply`

## Further documentation

### Related Repositories

| Name                                                                                | Description                                            |
| :---------------------------------------------------------------------------------- | :----------------------------------------------------- |
| [Dream Renewables Cms](https://github.com/OAMPC/DreamRenewablesCms)                 | The Content Management System for this web application |
| [Dream Renewables Frontend](https://github.com/OAMPC/DreamRenewablesFrontend)       | React code for this web application                    |
