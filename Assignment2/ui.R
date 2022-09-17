library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Predict Swiss Fertility indicators from agricultural occupation"),
    h5("This analysis is based on the 47 French-speaking provinces of Switzerland at about 1888."),
    h5("It shows the dependence of standardized fertility measure to the % of males involved in agriculture as occupation."),
    h5("Linear regression model is used."),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("Agri",
                        "% of agreculture as occupation:",
                        min = 0,
                        max = 100,
                        value = 50)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("ferPlot")
        )
    )
))
