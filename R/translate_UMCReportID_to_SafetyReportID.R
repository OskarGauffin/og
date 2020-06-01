#' @title translate_UMCReportID_to_SafetyReportID
#' 
#' @description
#' Querys UMCDB06, UMCReportWeekly (by default) and translates UMCReportIDs to SafetyReportIDs.
#'
#' @return
#' The SafetyReportIDs as a character vector. 
#'
#' @export

translate_UMCReportID_to_SafetyReportID <- function(umc_report_ids, database="UMCReportWeekly"){
# umc_report_ids = 
# database="UMCReportWeekly"
  
conn <- RODBC::odbcDriverConnect("DRIVER=SQL SERVER; SERVER=UMCDB06; Trusted_Connection=Yes")

safety_report_ids <- RODBC::sqlQuery(conn, 
                        paste0("SELECT SafetyReportID FROM ", database, ".UMCReport.Report rep
WHERE rep.ReportID in ('", paste0(umc_report_ids, collapse="', '"),"')"), as.is=T, errors=T)

#########################################################################################
# If we don't find all IDs we try to find the missing ones through the follow-up-table
#########################################################################################
if(length(unique(safety_report_ids)) != length(unique(umc_report_ids))){

replaced_report_ids <- RODBC::sqlQuery(conn, 
                                       paste0("SELECT DISTINCT rep.SafetyReportID, fu.ReplacedReportID FROM ", database, ".UMCReport.Report rep
                                       LEFT JOIN ", database, ".UMCReport.UMCCalculated_FollowUp fu
                                       ON rep.ReportID = fu.ReportID
WHERE fu.ReplacedReportID in ('", paste0(umc_report_ids, collapse="', '"),"')"), as.is=T, errors=T)  

safety_report_ids <- unique(c(safety_report_ids$SafetyReportID, 
                 replaced_report_ids$SafetyReportID[replaced_report_ids$ReplacedReportID %in% umc_report_ids]))
}

####################################################
# If we still don't find all IDs we give an error
####################################################
if(length(unique(safety_report_ids)) != length(unique(umc_report_ids))) {
  warning(cat("The number of found unique SafetyReportIDs don't match the length of the unique
  number of UMCReportIDs (SafetyReportIDs: ", length(unique(safety_report_ids)), ", UMCReportIDs: ",length(unique(umc_report_ids)), ")"))
}
  
# Provide the output to the clipboard
writeClipboard(safety_report_ids)
og::column_to_vec()
readClipboard()

# Also return it
safety_report_ids
}

