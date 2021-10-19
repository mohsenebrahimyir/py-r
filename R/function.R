## scientific_10 ---------------------------------------------------------------
scientific_10 <- function(x) {
  parse(text = gsub("e",  " %*% 10^", scales::scientific_format()(x)))
}

## Read Files -------------------------------------------------------------------
read_files <- function(file = NA, path = NA, header = TRUE , ...) {
  ## file <- "filename.csv"
  
  if (is.na(path)) {
    file_path <- file 
  } else {
    file_path <- paste0(path, file) 
  }
  
  file_path <- stringr::str_to_lower(file_path)
  
  dot <- 
    data.frame(
      dot = stringr::str_split(file_path, pattern = "")[[1]],
      num = 1:nchar(file_path)
    )
  
  num_dot <- max(dot[dot$dot == ".", "num"])
  
  suffix <-  stringr::str_sub(file_path, num_dot, nchar(file_path))
  
  if (suffix == ".csv") {
    readr::read_csv(file_path, col_names = header) 
  } else if (suffix == ".tsv") {
    readr::read_tsv(file_path, col_names = header)
  } else if (suffix == ".xlsx") {
    readxl::read_xlsx(file_path, col_names = header)
  } else if (suffix == ".xls") {
    readxl::read_xls(file_path, col_names = header)
  } else {
    cat("file isn't csv, tsv, xls or xlsx")
  }
}

## Pr and En digits ------------------------------------------------------------
digit_fa <- function(x = NA, fa = TRUE) {
  ## x <- 5468
  digit <- data.frame(
    "en" = as.character(0:9),
    "fa" = c("۰", "۱", "۲", "۳", "۴", "۵", "۶", "۷", "۸", "۹")
    )
  
  x <- as.character(x)
  x <- strsplit(x, split = "")
  x <- x[[1]]
  
  digit_fa  <- c()
  
  if (fa) {
    for (i in seq_along(x)) {
      # i = 1
      digit_fa[i] <- 
        ifelse(x[i] %in% digit$en, digit$fa[digit$en == x[i]], x[i])
    }
  } else {
      for (i in seq_along(x)) {
      # i = 1
      digit_fa[i] <- 
        ifelse(x[i] %in% digit$fa,  digit$en[digit$fa == x[i]], x[i])
      }
  }
  
  digit_fa <- paste0(digit_fa, collapse = "")
  
  return(digit_fa)
}


## Jalali to gorgian -----------------------------------------------------------
date_gr_to_jl <- function(date = Sys.Date()) {
  
  date <- as.Date(date)
  
  ## Convert Gregorian Date to Jalali Date
  jalali <-
    ConvCalendar::as.OtherDate(date, format = "%d%b%Y", calendar = "persian")

  ## Convert English Digits to Persian Digits
  jalali <- paste(jalali$year, jalali$month, jalali$day, sep = "-")

  return(jalali)
}

## My Table Style --------------------------------------------------------------
my_table_style <- function(dt) {
  dt <- kableExtra::kable_classic(dt)
  dt <- kableExtra::kable_styling(
    kable_input = dt,
    latex_options = "HOLD_position", full_width = TRUE, html_font = "IRANSans",
    bootstrap_options = c("striped", "hover", "condensed", "responsive")
  )

  return(dt)
}

