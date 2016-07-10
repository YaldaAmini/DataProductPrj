
#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    
    output$oid1 <- renderPrint({input$id1})
    output$oid2 <- renderPrint({input$id2})
    ##Loading Necessary Library
    #library("ggplot2")

    ##Make small data frame
    
    D1 <- data.frame(City = c(rep("LosAngeles",each=4),rep("Baltimore", each = 4)), 
                     year = c(1999,2002,2005,2008,1999,2002,2005,2008) ,
                     Emissions = c(3931,4373,4601,4101,346,184,130,108))
    ifelse(input$id2=="Baltimore", (D2 <- subset(D1, City=="Baltimore", c("Emissions", "year","City")) ),
          ( D2 <- subset(D1, City=="LosAngeles", c("Emissions", "year","City"))  )
            )
    
     # draw the line plot for specified city and specified year range
   
     plot(D2$year,D2$Emissions, type="l",col="purple",lwd="6",xlab="Year",ylab="Total PM25 Emissions",xlim=c(1999,input$Year))
    

  })
  
})
