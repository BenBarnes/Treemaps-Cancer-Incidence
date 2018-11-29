shinyUI(fluidPage(
  titlePanel("Treemaps of cancer incidence by age group and year"),
  fluidRow(
    column(8,
      sliderTextInput("age", "Age group", choices = mDat[, levels(AG2)],
        selected = mDat[, levels(AG2)[1]])
    )
  ),
  fluidRow(
    column(8,
      sliderInput("year", "Diagnosis year", min = mDat[, min(year)],
        max = mDat[, max(year)], value = mDat[, min(year)],
        step = 1, sep = "")
    )
  ),
  fluidRow(
    plotOutput("treeWomen")
  ),
  fluidRow(
    plotOutput("treeMen")
  )
))
