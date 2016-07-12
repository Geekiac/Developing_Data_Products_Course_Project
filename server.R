#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

y_1d <- c()
x_2d <- c()
y_2d <- c()

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
   stepSize <- reactive({
     input$stepSize
   })
   
   numSteps <- reactive({
     input$numSteps
   })
   
   output$walk_1d <- renderPlot({
     y_1d <<- c(0, runif(numSteps()-1, -stepSize(), stepSize()))
     y_1d <<- round(y_1d)
     for(i in 2:numSteps()) {
       y_1d[i] <<- y_1d[i] + y_1d[i-1]
     }
     
     plot(y_1d, type="l", col="blue")
     abline(h=0, col="red")
   })

   output$summary_1d <- renderPrint({
     "summary of y"
     summary(y_1d)
   })
     
      
   output$walk_2d <- renderPlot({
     vals <- c(0, runif(numSteps()-1, -stepSize(), stepSize()))

     x_2d <<- c(0)
     y_2d <<- c(0)
     
     for(i in 2:numSteps()) {
       if(i %% 2 == 0) {
         x_2d[i] <<- x_2d[i-1] + vals[i]
         y_2d[i] <<- y_2d[i-1]
       } else {
         x_2d[i] <<- x_2d[i-1]
         y_2d[i] <<- y_2d[i-1] + vals[i]
         
       }
     }
     
     plot(x_2d, y_2d, type="l", col="blue")
     abline(h=0, col="red")
     abline(v=0, col="red")
   })

   output$summary_2d_x <- renderPrint({
     summary(x_2d)
   })

   output$summary_2d_y <- renderPrint({
     summary(y_2d)
   })
})

