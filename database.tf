resource "aws_glue_catalog_database" "random" {
  name = "randomdb"
}


resource "aws_glue_catalog_table" "catalog_table" {
  name          = "randomtable"
  database_name = aws_glue_catalog_database.random.name

  table_type = "EXTERNAL_TABLE"

  parameters = {
    EXTERNAL              = "TRUE"
    "parquet.compression" = "SNAPPY"
  }

  storage_descriptor {
    location      = "s3://emr-athena-bucket-akashp7/data-output/filtered"
    input_format  = "org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat"
    output_format = "org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat"

    ser_de_info {
      name                  = "my-stream"
      serialization_library = "org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe"

      parameters = {
        "serialization.format" = 1
      }
    }

    columns {
      name    = "added"
      type    = "bigint"
      comment = ""
    }
    columns {
      name    = "channel"
      type    = "string"
      comment = ""
    }
    columns {
      name    = "cityName"
      type    = "string"
      comment = ""
    }
    columns {
      name    = "comment"
      type    = "string"
      comment = ""
    }
    columns {
      name    = "countryIsoCode"
      type    = "string"
      comment = ""
    }
    columns {
      name    = "countryName"
      type    = "string"
      comment = ""
    }
    columns {
      name    = "deleted"
      type    = "bigint"
      comment = ""
    }
    columns {
      name    = "delta"
      type    = "bigint"
      comment = ""
    }
    columns {
      name    = "isAnonymous"
      type    = "boolean"
      comment = ""
    }
    columns {
      name    = "isMinor"
      type    = "boolean"
      comment = ""
    }
    columns {
      name    = "isNew"
      type    = "boolean"
      comment = ""
    }
    columns {
      name    = "isRobot"
      type    = "boolean"
      comment = ""
    }
    columns {
      name    = "isUnpatrolled"
      type    = "boolean"
      comment = ""
    }
    columns {
      name    = "metroCode"
      type    = "bigint"
      comment = ""
    }
    columns {
      name    = "namespace"
      type    = "string"
      comment = ""
    }
    columns {
      name    = "page"
      type    = "string"
      comment = ""
    }
    columns {
      name    = "regionIsoCode"
      type    = "string"
      comment = ""
    }
    columns {
      name    = "regionName"
      type    = "string"
      comment = ""
    }
    columns {
      name    = "time"
      type    = "string"
      comment = ""
    }
    columns {
      name    = "user"
      type    = "string"
      comment = ""
    }
  }
}

# resource "aws_athena_named_query" "example_query" {
#   database = "your_database"
#   query    = "SELECT * FROM MyCatalogDatabase.MyCatalogTable LIMIT 10"  # Example query

#   name                 = "ExampleQuery"
#   description          = "Example query description"
  
  
# }