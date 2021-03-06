#' @title library_packages
#' Installs and loads my favourite packages
#'
#' @description
#' Installs and loads my favourite packages
#' 
#' @param package_vec Provide the function with custom packages to install and load. Default is "plyr", "dplyr", "magrittr", "data.table", "stringr" and "lubridate".
#'
#' @return
#' Nothing
#' 
#' library_packages()
#'
#' @export
library_packages <- function(package_vec = NULL){
  
  install_if_missing <- function(package_vec=c("package_A","package_B")){
    # Function that installs packages that are not installed
    for(i in 1:length(package_vec)){
      if(! package_vec[i] %in% installed.packages()[,1]){
        suppressMessages(invisible(install.packages(package_vec[i], repos='http://cran.us.r-project.org')))
      }
    }
  }
  
  package_vec <- c("plyr", "dplyr", "magrittr", "data.table", "stringr", "lubridate")
  install_if_missing(package_vec)
  invisible(suppressMessages(lapply(package_vec, library, character.only=T)))
}
