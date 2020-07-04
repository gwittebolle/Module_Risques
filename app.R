library(shiny)
library(DT)
library(tcltk)
library(readxl)
library(shinymanager)
credentials <- data.frame(
  user = c("shiny", "shinymanager"),
  password = c("azerty", "12345"),
  stringsAsFactors = FALSE
)

# Define UI for application that draws a histogram
ui <- secure_app(fluidPage(


    # Application title
    titlePanel("Climate Physical Risk Analysis"),

    DT::dataTableOutput('ex1')
    
))

# Define server logic required to draw a histogram
server <- function(input, output) {


  res_auth <- secure_server(
    check_credentials = check_credentials(credentials)
  )
  
 # output$auth_output <- renderPrint({
 #   reactiveValuesToList(res_auth)
 # })
  
    
    output$ex1 <- DT::renderDataTable(

      DT::datatable(read_excel(paste(getwd(),"/Data-TGE.xlsx", sep="")), rownames = FALSE, filter = 'top', options = list(pageLength = 10, searching = TRUE, bfilter = 0))
    )
}

# Run the application 
shinyApp(ui = ui, server = server)
