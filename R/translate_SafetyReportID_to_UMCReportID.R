#' @title translate_SafetyReportID_to_UMCReportID
#' 
#' @description
#' Querys UMCDB06, UMCReportWeekly (by default) and translates SafetyReportIDs to UMCReportID using the Report-table.
#'
#' @return
#' The UMCReportID as a character vector. 
#'
#' @export

translate_SafetyReportID_to_UMCReportID <- function(safety_report_ids, database="UMCReportWeekly"){
  # umc_report_ids = 
  # database="UMCReportWeekly"
  
  conn <- RODBC::odbcDriverConnect("DRIVER=SQL SERVER; SERVER=UMCDB06; Trusted_Connection=Yes")
  
  report_ids <- RODBC::sqlQuery(conn, 
                                       paste0("SELECT ReportID, SafetyReportID FROM ", database, ".UMCReport.Report rep
WHERE rep.SafetyReportID in ('", paste0(safety_report_ids, collapse="', '"),"')"), as.is=T, errors=T)
  
  # The SafetyReportIDs are not tracked in any way, since they don't change with report updates. But they are not unique,
  # so we should mark up the ones which finds several reports. 
  
  report_ids$duplicate_safetyreportID <- duplicated(report_ids$SafetyReportID)  
  
  ####################################################
  # If we still don't find all IDs we give an error
  ####################################################
  if(any(report_ids$duplicate_safetyreportID)) {
    warning(cat("The following SafetyReportIDs had multiple matches (SafetyReportIDs: ", unique(report_ids$SafetyReportID[duplicate_safetyreportID]), 
                " in total N = ", length(unique(report_ids$SafetyReportID[duplicate_safetyreportID])), "SafetyReportIDs"))
  } else {
    report_ids <- report_ids["ReportID"]
  }
  
  # Provide the output to the clipboard
  writeClipboard(report_ids)
  og::column_to_vec()
  readClipboard()
  
  # Also return it
  safety_report_ids
}

