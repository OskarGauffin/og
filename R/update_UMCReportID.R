#' @title update_UMCReportID
#' 
#' @description
#' Querys UMCDB06, UMCReportWeekly (by default) and updates any passed UMCReportID to the latest mapped reportID in the follow-up-table.
#'
#' @return
#' The updated UMCReportID as a character vector. 
#'
#' @export

update_UMCReportID <- function(report_ids_to_update, database="UMCReportWeekly"){
  # report_ids_to_update = 
  # database="UMCReportWeekly"
  
  report_ids_to_update <- unique(report_ids_to_update)
  conn <- RODBC::odbcDriverConnect("DRIVER=SQL SERVER; SERVER=UMCDB06; Trusted_Connection=Yes")

  report_ids_df <- RODBC::sqlQuery(conn, 
                                       paste0("SELECT ReportID, ReplacedReportID FROM ", database, ".UMCReport.UMCCalculated_FollowUp fu
WHERE fu.ReplacedReportID in ('", paste0(report_ids_to_update, collapse="', '"),"')"), as.is=T, errors=T)
  
  
  # If there was any updates
  if(nrow(report_ids_df)>0){
  # Here are the updated ones
  updated <- unique(report_ids_df$ReportID[ReplacedReportID %in% report_ids_df])
  
  # Here are the non-updated ones
  not_updated <- unique(report_ids_df$ReportID[! report_ids %in% ReplacedReportID])
  
  all_report_ids <- unique(c(updated, not_updated))
  } 
  
  # No updates found:
  else {
    
    all_report_ids <- report_ids_to_update
    
  }
  
  #############################################################################
  # If we don't find all IDs, most likely due to deletion, we give a warning
  #############################################################################
  if(length(all_report_ids)!=length(report_ids_to_update)) {
    warning(cat("Something is wrong, the updated reportIDs are ", ifelse(length(all_report_ids)>length(report_ids_to_update), "longer" , "shorter"),
                " than the inserted ones"))
  }
  
  # Provide the output to the clipboard
  writeClipboard(all_report_ids)
  og::column_to_vec()
  readClipboard()
  
  # Also return it
  all_report_ids
}

