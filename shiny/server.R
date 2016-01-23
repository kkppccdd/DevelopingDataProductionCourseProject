library(shiny)
library(datasets)
library(ggplot2)

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

shinyServer(function(input,output){
  #outcome<-input$outcome
  #predictor<-input$predictor
  output$outcome<-renderText({input$outcome})
  output$predictor<-renderText({input$predictor})
  
  output$slope<-renderText(
    {
      fit<-lm(mtcars[,input$outcome]~mtcars[,input$predictor],data=mtcars)
      coef(fit)[[2]]
    }
  )
  output$intercept<-renderText(
    {
      fit<-lm(mtcars[,input$outcome]~mtcars[,input$predictor],data=mtcars)
      coef(fit)[[1]]
    }
  )
  output$fitPlot<-renderPlot({
    fit<-lm(mtcars[,input$outcome]~mtcars[,input$predictor],data=mtcars)
    plot(x=mtcars[,input$predictor],
                 y=mtcars[,input$outcome],
                 type="p",
                  col="blue",
                lwd=5,
                 main=paste("Linear Regression model between",
                            featureLabels[[input$outcome]],
                            "and",
                            featureLabels[[input$outcome]],
                            sep=" "),
                 xlab=featureLabels[[input$predictor]],
                 ylab=featureLabels[[input$outcome]])
    abline(fit)
  })
})