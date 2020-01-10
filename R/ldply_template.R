#' @title ldply_template
#' Inserts an ldply-template into the clipboard
#'
#' @description
#' Inserts a skeleton ldply-template into the clipboard
#'
#' @param split_variable  The variable to split the data frame by. 
#'
#' @return
#' Nothing
#'
#'
#' @export
ldply_template <- function(split_variable=NULL){
  
  # Copy the skeleton 
  output <- "data_list <- split(df, factor(df$X))
  
  out_df <- plyr::ldply(data_list, .progress='text',  function(x){ 
      # x <- data_list[[1]]
      
      tryCatch({
      
      
      }, error=function(e){'Some error occurred'})
})"
  
  # Render the split-variable if provided
  if(!is.null(split_variable)){
    output <- gsub("X", split_variable, output)
  }
  
  # Write to clipboard, and return it for testing
  utils::writeClipboard(output)
  return(invisible(output))
}

