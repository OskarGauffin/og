#' @title where_was_function_defined
#' Uses srcref to find (if possible) in what file a function was defined.
#'
#' @description
#' Uses srcref to find (if possible) in what file a function was defined.
#'
#' @param function_name The function name as a string.
#' @return
#' Prints the file name
#'
#' @export
where_was_function_defined <- function(function_name){
  attr(attr(function_name,"srcref"),"srcfile")$filename
}