library(treemap)
library(data.table)
library(shiny)
library(shinyWidgets)

base <- "/Users/benbarnes2/Documents/RKI/Visualize"

canDat <- fread(file.path(base, "Krebsdaten.csv"))
mDat <- melt(canDat, id.vars = c("year", "diag", "AG"),
  measure.vars = c("weiblich", "maennlich"), variable.name = "sex",
  value.name = "cases")
mDat <- mDat[cases != "x"]
mDat[, cases2 := as.numeric(gsub("\\.", "", cases))]
mDat[, AG2 := factor(AG,
  levels = unique(AG)[order(as.numeric(gsub("([0-9]{1,2}).*", "\\1", unique(AG))))])]
mDat[, sex := factor(sex)]
mDat[, theColor := rgb(t(col2rgb(c("blue", "green"))),
  maxColorValue = 255)[as.integer(sex)]]

treeDatFun <- function(theYear, theAG, theSex) {
  as.data.frame(mDat[year == theYear & AG2 == theAG & sex == theSex])
}

treemap(treeDatFun(2014, "50 - 54", "maennlich"),
  index = "diag", vSize = "cases2", vColor = "sex", type = "categorical")
