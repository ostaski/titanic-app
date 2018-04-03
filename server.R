library(shiny)

data(Titanic)
df <- as.data.frame(Titanic)

shinyServer( function(input, output) {
  
  output$plot <- renderPlot({
    
    selectedData <- df[df$Class == input$class & df$Sex == input$sex & df$Age == input$age, 5]
    
    barplt <- barplot(selectedData,
                    
                    beside = TRUE, horiz = TRUE, xlim = c(0,700),
                    
                    main="Passengers' Fates Based on Class, Sex and Age",
                    
                    ylab="Total",
                    
                    col=c("black", "grey"),
                    
                    legend = c("Died", "Survived")
    )
    
    text(x = selectedData + 20,
         
         y = barplt,
         
         labels = as.character(selectedData),
         
         xpd = TRUE)
    
  })
  
})

