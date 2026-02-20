
library(readr)
library(DBI)
library(tools)
library(odbc)
library(DBI)


pacman::p_load(readr, DBI, tools, odbc)
#Check drivers shows a list of your drivers
sort(unique(odbcListDrivers() [[1]])) #View drivers

#Connect


con <- DBI::dbConnect(
  odbc::odbc(),
  Driver = "ODBC Driver 17 for SQL Server",
  Server = "LAPTOP-PTVDVGSP\\SQL2025",
  Database = "Projects_Database",
  Trusted_Connection = "Yes"
)



files <- list.files(
  "C:/Data/Skills Test/Data",
  pattern = "\\.csv$",
  recursive = TRUE,
  full.names = TRUE
)

length(files)
head(files)

for (f in files) {          # ← opening { for the loop
  
  tbl <- tools::file_path_sans_ext(basename(f))
  tbl <- gsub("[^A-Za-z0-9_]", "_", tbl)
  
  message("Loading: ", f, " -> ", tbl)
  
  df <- readr::read_csv(f, show_col_types = FALSE)

  if (DBI::dbExistsTable(con, tbl)) {
    message("Table already exists, dummy: ", tbl)
  } else {
    DBI::dbWriteTable(
      con,
      name = DBI::Id(schema = "dbo", table = tbl),
      value = df,
      overwrite = FALSE,
      append = FALSE
    )
  }             
  
}  








