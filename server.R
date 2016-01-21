#DevDataProducts Project Assignment
#Cost of buying or proceed from selling shares
library(shiny)

#server codes
function(input, output) {
    # Calculate output    
    icost <- reactive({input$units*input$price})
    broker <- reactive({icost()*as.numeric(input$rateb)*1.06})
    cfee <- reactive({icost()*0.3/100})
    sduty <- reactive({input$units/input$price/1000})
    fees <- reactive({broker() + cfee() + sduty()})
    totalb <- reactive({icost() + fees()})
    totals <- reactive({icost() - fees()})
    # Display entered values
    output$inputValuebuysel <- renderText({paste(" Transaction: ", input$buysel)})
    output$inputValueunits <- renderText({paste(" Shares units: ",format(input$units, big.mark=",", scientific=F))})
    output$inputValueprice <- renderText({paste(" At Unit Price: ",input$price)})
    # Display calculated values
    output$cost <- renderText({paste("Initial cost:",icost())})
    output$Allfees <- renderText({paste("Fees:", round(fees(), digits = 2))})
    output$total <- renderText({
        if(input$buysel=="Buy") {
            total <- totalb()}
        else
        {total <- totals()
        }     
        paste("Total:", format(round(total, digits = 2),big.mark=",", scientific=F))
    })
}