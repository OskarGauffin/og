# og
<!-- badges: start -->
[![Travis build status](https://travis-ci.org/OskarGauffin/og.svg?branch=master)](https://travis-ci.org/OskarGauffin/og)
[![Codecov test coverage](https://codecov.io/gh/OskarGauffin/og/branch/master/graph/badge.svg)](https://app.codecov.io/gh/OskarGauffin/og?branch=master)
<!-- badges: end -->

Provides two convenient functions which requires clipboard compatibility from the utils package, i.e. windows.

1. *file.choose()* When using og::file.choose(), the path of the selected file is automatically copied to the clipboard. 
2. *column_to_vec()* If you have a column of strings and want to turn those into an R-vector, simply copy the column into the clipboard, run a function, and paste the clipboard. 
