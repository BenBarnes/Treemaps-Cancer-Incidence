shinyServer(function(input, output, session) {
  curYear <- reactive(input$year)
  curAge <- reactive(input$age)

  output$treeMen <- renderPlot({
    treemap(treeDatFun(curYear(), curAge(), "maennlich"),
      index = "diag", vSize = "cases2", vColor = "theColor", type = "color",
      title = "Treemap of incidence among men")
  })
  output$treeWomen <- renderPlot({
    treemap(treeDatFun(curYear(), curAge(), "weiblich"),
      index = "diag", vSize = "cases2", vColor = "theColor", type = "color",
      title = "Treemap of incidence among women")
  })
})