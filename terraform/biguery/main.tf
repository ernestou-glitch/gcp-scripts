#created bq dataset requiered to create a table
# https://www.terraform.io/docs/providers/google/r/bigquery_dataset.html

resource "google_bigquery_dataset" "bq-dataset" {
  dataset_id                  = "first_dataset"
  friendly_name               = "test-no-prod"
  description                 = "My first dataset"
  location                    = "US"
  labels = {
    env = "terraform-demo"
  }
}

#create bq table
# https://www.terraform.io/docs/providers/google/r/bigquery_table.html

resource "google_bigquery_table" "bq-table" {
  dataset_id = google_bigquery_dataset.bq-dataset.dataset_id
  table_id   = "hr_table"

  #Option to create a partitioned table
  # time_partitioning {
  #   type = "DAY"
  # }

  labels = {
    env = "default"
  }

#BQ SQL data types https://cloud.google.com/bigquery/docs/reference/standard-sql/data-types
#this section defines the SCHEMA by a JSON file https://www.terraform.io/docs/providers/google/r/bigquery_table.html#schema
  schema = <<EOF
[
  {
    "name": "permalink",
    "type": "STRING",
    "mode": "NULLABLE",
    "description": "The Permalink"
  },
  {
    "name": "state",
    "type": "STRING",
    "mode": "NULLABLE",
    "description": "State where the head office is located"
  }
]
EOF

}

#Describes the data format, location, and other properties of a table stored outside of BigQuery. 
#By defining these properties, the data source can then be queried as if it were a standard BigQuery table.

resource "google_bigquery_table" "sheet" {
  dataset_id = google_bigquery_dataset.bq-dataset.dataset_id
  table_id   = "sheet"

  external_data_configuration {
    autodetect    = true
    source_format = "GOOGLE_SHEETS"

    google_sheets_options {
      skip_leading_rows = 1
    }

    source_uris = [
      "https://docs.google.com/spreadsheets/d/DOCUMENT-ID",
      #look at the URL of your sheets file and copy the ID after d/ in the URL
    ]
  }
}


resource "google_bigquery_table" "view" {
  dataset_id = google_bigquery_dataset.bq-dataset.dataset_id
  table_id   = "view_table"

  view {
    query = "Select field1, field2 from project.dataset.table"
    use_legacy_sql = false #The best practice is to avoid using Legacy SQL
  }
}