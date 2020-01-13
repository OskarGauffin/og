test_that("ldply_template", {
  
  skip_on_travis()
  expect_equal(out <- ldply_template(), "data_list <- split(df, factor(df$X))\n  \n  out_df <- plyr::ldply(data_list, .progress='text',  function(x){ \n      # x <- data_list[[1]]\n      \n      tryCatch({\n      \n      \n      }, error=function(e){'Some error occurred'})\n})")
})
