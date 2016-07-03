#
# This is the server logic of a Shiny web application. 
# 
# 
#

library(shiny)
library(ggplot2)
library(reshape2)

# Define server logic required to draw a plot
shinyServer(function(input, output) {
  
  output$plot_out_put <- renderPlot({
    # wait to plot until 'submit button is pressed'
    if(input$submitButton == 0)
            return()
    input$submitButton
    isolate({
            # my_data is shared from global.R
            # extract the subset data
            subset_data <- my_data[my_data$Series.Name == input$SeriesName 
                                   & my_data$Country.Name %in% input$CountryNames, ]
            rownames(subset_data) <- subset_data$Country.Name
            subset_data <- subset_data[, -c(1:4)]
            
            # convert data frame
            subset_data$metadata <- row.names(subset_data)
            subset_data <- melt(subset_data, "metadata")
            
            # plot
            p <- ggplot(subset_data, aes(variable, value, group = metadata, color = metadata)) + 
                    geom_line() + geom_point() + 
                    ggtitle(paste(input$SeriesName, ' ', "2000 - 2015")) +
                    xlab('Year') + ylab(input$SeriesName)
            p
    }
    )
    
  })
  
})
