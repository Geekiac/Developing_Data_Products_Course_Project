#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
   
   # Application title
   titlePanel("Random walks simulations in 1D and 2D"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         sliderInput("stepSize",
                     "Step Size:",
                     min = 1,
                     max = 50,
                     value = 1),
         sliderInput("numSteps",
                     "Number Of Steps:",
                     min = 100,
                     max = 10000,
                     value = 1000,
                     step = 100)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
        tabsetPanel(
          tabPanel("1D Walk ", plotOutput("walk_1d")),
          tabPanel("1D Summary", 
                   h3("Summary of x"),
                   verbatimTextOutput("summary_1d")),
          tabPanel("2D Walk", plotOutput("walk_2d")),
          tabPanel("2D Summary", 
                   h3("Summary of x"),
                   verbatimTextOutput("summary_2d_x"),
                   h3("Summary of y"),
                   verbatimTextOutput("summary_2d_y"))
        )
      )
   ),
   mainPanel(
     h2("Description"),
     p("This application is used to generate a random walk in both 1-dimension and 2-dimensions."),
     h2("Instructions"),
     p("To change the size of each step, use the \"Step Size\" slider in the top left."),
     p("To change the number of each steps use the \"Number of Steps\" slider in the top left."),
     p("You can use the tabs in the top right to switch between walk and summary views.")
   )
   
))

