#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Data Polution (PM25) Trends in selected year range in selected city between LosAngeles and Baltimore"),
  
  # Sidebar with a slider input for select the maximum year (xaxis max) 
  
  sidebarLayout(
    sidebarPanel(
       sliderInput("Year",
                   "Select End Year",
                   min = 1999,
                   max = 2008,
                   value = 2008,
                   step=3),

    checkboxGroupInput("id2","Please Select a City to Show related Data",
                       c("Baltimore City"= "Baltimore",
                         "LosAngeles City" = "LosAngeles"))
    # numericInput('id1','Numeric input, Labed_id1',0,min=0,max=4, step=1)
      
                                        ),
  
    
    # Show a plot of the generated distribution
    mainPanel(
        h3('The City You Has Been Selected'),
        verbatimTextOutput("oid2"),
        plotOutput("distPlot")
    )
  )
))
