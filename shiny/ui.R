library(shiny)
library(datasets)
features<-colnames(mtcars)
featureLabels<-list("mpg"="Miles/(US) gallon",
                    "cyl"="Number of cylinders",
                    "disp"="Displacement (cu.in.)",
                    "hp"="Gross horsepower",
                    "drat"="Rear axle ratio",
                    "wt"="Weight (1000 lbs)",
                    "qsec"="1/4 mile time",
                    "vs"="V/S",
                    "am"="Transmission (0 = automatic, 1 = manual)",
                    "gear"="Number of forward gears",
                    "carb"="Number of carburetors")
shinyUI(fluidPage(
  titlePanel("Data Science Specilization - Developing Data Production - Assignment"),
  span("by Ray Cai"),
  
  sidebarLayout(
    
    sidebarPanel(
      withMathJax(),
      h3("Build Single Variable Linear Regression Model"),
      helpText("You could choose the ",strong("outcome")," and ", strong("predictor"),
               " to fit model:"),
      h2("$$y=\\beta_0+\\beta_1x$$"),
      selectInput("outcome",label=h3("Outcome"),
                  choices=features,selected=1),
      selectInput("predictor",label=h3("Predictor"),
                  choices=features,selected=features[2]),
      submitButton("Build model")
    ),
    
    mainPanel(
      withMathJax(),
      p("Based on dataset ", code("mtcars"), ", take",
        strong(textOutput("outcome",inline=TRUE)),
        " as outcome and ",
        strong(textOutput("predictor",inline=TRUE)),
        " as predictor. Built linear regression model to fit:"),
      h2("$$y=\\beta_0+\\beta_1x$$"),
      p("Get:"),
      h4("$$\\beta_0: $$",align="left"),
      strong(textOutput("intercept", inline=TRUE)),
      h4("$$\\beta_1: $$"),
      strong(textOutput("slope", inline=TRUE)),
      plotOutput("fitPlot")
    )
  )
  
))