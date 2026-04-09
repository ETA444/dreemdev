# requirements.R
# Install core packages for the R playground environment

# --- Data wrangling & manipulation ---
install.packages(c(
  "data.table",   # fast tables
  "dplyr",        # tidy data manipulation
  "tidyr",        # reshaping
  "readr"         # fast CSV, TSV, etc.
))

# --- Visualization ---
install.packages(c(
  "ggplot2",      # grammar of graphics
  "plotly"        # interactive plots
))

# --- Modeling & ML ---
install.packages(c(
  "tidymodels",   # modeling framework (parsnip, recipes, workflows, tune...)
  "xgboost",      # gradient boosting for tabular data
  "ranger"        # fast random forests
))

# --- Data I/O & storage ---
install.packages(c(
  "DBI",          # database interface
  "RPostgres",    # PostgreSQL driver
  "arrow"         # Apache Arrow / Parquet
))

# --- Web & APIs ---
install.packages(c(
  "httr2",        # modern HTTP client
  "plumber"       # build REST APIs with R
))

# --- Notebooks & reporting ---
install.packages(c(
  "rmarkdown",    # R Markdown
  "knitr",        # dynamic reporting
  "IRkernel"      # R kernel for Jupyter
))

# --- Utilities ---
install.packages(c(
  "fs",           # file system helper
  "glue"          # string interpolation
))

# --- Testing & code quality ---
install.packages(c(
  "testthat",     # unit testing
  "lintr",        # linter
  "styler"        # code formatter
))
