library(shiny)

checkbox <- function(){
  data <- read.table("database.txt", sep = ";", header = TRUE, encoding = "UTF-8")
  data <- data[!(data[, 2] == '?'),]
  result <- as.vector(data[,1])
  names(result) <- result
  return (result)
}

shinyUI(pageWithSidebar(
  headerPanel("Temperature in IF"),
  
  sidebarPanel(
    checkboxGroupInput("year", "Select year:", checkbox())
  ),
  
  mainPanel(
    plotOutput("plot")
  )
)
)