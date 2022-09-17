library(shiny)
library(stats)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    fit1 <- lm(Fertility ~ Agriculture, data = swiss)
    
    predicted <- reactive({
        predict(fit1, newdata = data.frame(Agriculture = input$Agri))
    })

    output$ferPlot <- renderPlot({
        plot(swiss$Agriculture, swiss$Fertility, xlab = "% of agriculture", ylab = "Fertility")
        abline(fit1, col = "red", lwd = 2)
        points(input$Agri, predicted(), col = "red", pch = 16, cex = 2)
    })
})