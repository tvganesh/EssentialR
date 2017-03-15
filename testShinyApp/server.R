#############################################################################
#
# Essential R
# Hit the ground running - A quick tutorial of  R programming
# Author: Tinniam V Ganesh
# Date : 15/3/2017
# Email: tvganesh.85@gmail.com 
# Blog: https://gigadom.wordpress.com/
# File: server.R
# Source: https://shiny.rstudio.com/
#
#############################################################################

# Rely on the 'WorldPhones' dataset in the datasets
# package (which generally comes preloaded).
library(datasets)

# Define a server for the Shiny app
function(input, output) {
  
  # Fill in the spot we created for a plot
  output$phonePlot <- renderPlot({
    
    # Render a barplot
    barplot(WorldPhones[,input$region]*1000, 
            main=input$region,
            ylab="Number of Telephones",
            xlab="Year")
  })
}