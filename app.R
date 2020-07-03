library(shiny)
library(DT)
library(tcltk)
library(readxl)

# Define UI for application that draws a histogram
ui <- fluidPage(


    # Application title
    titlePanel("Climate Physical Risk Analysis"),

    DT::dataTableOutput('ex1')
    
)

# Define server logic required to draw a histogram
server <- function(input, output) {


    
    output$ex1 <- DT::renderDataTable(

      DT::datatable(read_excel(paste(getwd(),"/Data-TGE.xlsx", sep="")), rownames = FALSE, filter = 'top', options = list(pageLength = 10, searching = TRUE, bfilter = 0))
    )
}

# Run the application 
shinyApp(ui = ui, server = server)
