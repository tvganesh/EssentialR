#############################################################################
#
# Essential R
# Hit the ground running - A quick tutorial of  R programming
# Author: Tinniam V Ganesh
# Date : 15/3/2017
# Email: tvganesh.85@gmail.com 
# Blog: https://gigadom.wordpress.com/
# File: ui.R
# Source: https://shiny.rstudio.com/
#
#############################################################################
# Rely on the 'WorldPhones' dataset in the datasets
# package (which generally comes preloaded).
library(datasets)

# Use a fluid Bootstrap layout
fluidPage(    
  
  # Give the page a title
  titlePanel("Telephones by region"),
  
  # Generate a row with a sidebar
  sidebarLayout(      
    
    # Define the sidebar with one input
    sidebarPanel(
      selectInput("region", "Region:", 
                  choices=colnames(WorldPhones)),
      hr(),
      helpText("Data from AT&T (1961) The World's Telephones.")
    ),
    
    # Create a spot for the barplot
    mainPanel(
      plotOutput("phonePlot")  
    )
    
  )
)