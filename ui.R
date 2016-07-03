#
# This is the user-interface definition of a Shiny web application.
#
#

library(shiny)
require(markdown)

seriesNames <- as.character(unique(my_data$Series.Name))
countryNames <- as.character(unique(my_data$Country.Name))

# Define UI for application that draws a histogram
shinyUI(pageWithSidebar(
        headerPanel("World Development Prediction"),
        
        sidebarPanel(
                selectInput('SeriesName', 'Select Series Name', 
                            seriesNames, selectize = FALSE),
                
                selectInput('CountryNames', 'Select Country Names (move cursor and click "Delete" keypress to deselect)',
                            countryNames, multiple = TRUE),
                br(),
                actionButton('submitButton', 'Submit & Plot')
        ),
        mainPanel(
                tabsetPanel(
                        tabPanel("Plot", plotOutput("plot_out_put")),
                        tabPanel("Document", includeMarkdown("README.md"))
                )
        )
  )
)
