#' @title sql-temptable-template
#' Inserts an sql-temptable-template into the clipboard
#'
#' @description
#' Inserts a sql-temptable-template into the clipboard
#'
#'@param temptable_name If a temptable_name is provided, it is inserted into the drop-table and create-temptable-positions in the template.
#'
#' @return
#' Nothing
#'
#'
#' @export
sql_temptable_template <- function(temptable_name=NULL){
  
  # Copy the skeleton 
  output <- "
sqlQuery(conn, 'DROP TABLE IF EXISTS #tt;')

sqlQuery(conn,   
  'SELECT * INTO #tt (
  -- Insert SQL-code here
) a_name_for_the_subquery')"

# Render the split-variable if provided
if(!is.null(temptable_name)){
  output <- gsub("#tt", paste0("#", temptable_name), output)
}
  
# Write to clipboard, and return it for testing
  utils::writeClipboard(output)
  return(invisible(output))
}

