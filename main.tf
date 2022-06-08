terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.25.17"
    }
  }

  backend "remote" {
    organization = "Suddhantar"

    workspaces {
      name = "TFworkflows"
    }
  }
}

provider "snowflake" {
}

resource "snowflake_database" "demodb" {
  name    = "DEMODB"
  comment = "Database for Snowflake Terraform demo"
}

resource "snowflake_schema" "demo_schema" {
  database = snowflake_database.demodb.name
  name     = "DEMO_SCHEMA"
  comment  = "Schema for Snowflake Terraform demo"
}

resource "snowflake_schema" "demo_schem" {
  database = snowflake_database.demodb.name
  name     = "DEMO_SCHEM"
  comment  = "Schem for Snowflake Terraform demo"
}