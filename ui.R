#DevDataProducts Project Assignment
#Cost of buying or proceed from selling shares
library(shiny)

#ui codes
pageWithSidebar(
    headerPanel("Cost of buying or proceed from selling shares Calculator"),
    sidebarPanel(
        radioButtons("buysel", label = p("Buying or Selling"),
                     choices = list("Buy" = "Buy", "Sell" = "Sell"),selected = "Buy"
        ),
        numericInput("units", "Number of Units", 10800, min = 100, max = 100000, step = 100
        ),
        helpText("Allowable range is between 100 to 100,000 - in 100 incremental units"),
        numericInput("price", "Shares Price", 0.75, min = .005, max = 1000, step = 0.05
        ),
        helpText("Allowable range is between 0.05 to 1,000"),
        selectInput("rateb", "Brokerage Rate(%)",multiple = FALSE, selected = 0.42/100,
                    c("0.10" = 0.1/100, "0.42" = 0.42/100, "0.70" = 0.7/100))
    ),
    
    mainPanel(
        tabsetPanel(
            tabPanel("Results",
                     h3("Your choices of Inputs", style = "color:blue"),
                     textOutput("inputValuebuysel"),
                     textOutput("inputValueunits"),
                     textOutput("inputValueprice"),
                     br(),
                     h3("Transaction Summary", style = "color:green"),
                     verbatimTextOutput("cost"),
                     verbatimTextOutput("Allfees"),
                     verbatimTextOutput("total")
            ),
            tabPanel("Readme", 
                     p(h4("Application Summary", style = "color:blue")),
                     p("This simple application is to calculate the cost or proceeds involved 
                       during buying or selling shares in Msia. There are other fixed 
                       variables which is not made as variable in the input option, which 
                       are Good & Services Tax(GST) at 6% imposed on the brokerage fee and clearing fee 
                       at 0.3%."),
                     HTML("The basic calculation block are: <br>
                          1. Initial cost <br>  
                          2. Brokerage fee with GST <br>  
                          3. Clearing fee <br>  
                          4. Stamp duty <br>"),  
                     p("For a BUY transaction, add all blocks (1-4) above, and for a 
                       SELL transaction, all fees and duty will be deducted from initial 
                       cost."),
                     helpText("The purpose of this application is to automate the calculation 
                              of cost payable to brokers or due to you before a transaction 
                              happens."),
                     br(),
                     h4("How to use this application", style = "color:blue"),
                     p("To get the transaction summary, choose the transaction type, 
                       which is a buy or sell, then input the number of shares unit, its 
                       price and brokerage rate(%).
                       As you adjust the input values, the transaction summary results  
                       will automatically update based upon new values."),
                     br(),
                     p("**This is a simple apps for demonstration purpose and 
                       further customisation is possible.**")
                     )
                     )
                     )
                     )
