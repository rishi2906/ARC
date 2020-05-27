#### Add the function to call the server function foreach and every module
#### you directly pass the function name and id (same as that given for that
#### module In UI part) to the function callModule() 
library (shiny)
shinyServer(function(input, output, session) {
    USER <- reactiveValues(Logged = FALSE, session = session$user)
    source ("www/Login.R", local=TRUE)
    source("www/PortfolioOption/PortfolioServer.R",local=TRUE)
    PORT <- reactiveValues(LoggedPort = FALSE,Portfolio=NULL,Regulation=NULL)
     callModule(imageShow,"image")
     callModule(eda,"eda")
     callModule(readCSV,"read_csv")
    # callModule(dbConnection,"dbConnect") 
     callModule(Pre_processing,"Pre_processing") 
     callModule(methodology,"methodology") 
     callModule(generateFeatures,"generate _feature")
    # callModule(reportServer,"report")
   
    
     observeEvent(input$tab,
      {      
       if(input$tab == "edaUI")
         {
      observe({cat(stderr(),"Sidebar",input$sbmenu,"tab",input$tab)})
         callModule(eda,"eda")
         }
      }
    )
     
         
    observeEvent(input$tab,{
       
       if(input$tab=="performanceUI")
       {
         observe({cat(stderr(),"Sidebar",input$sbmenu,"tab",input$tab)})
         
          callModule(performance,"performance")
         
       }
       
       
            })
    
   
     observeEvent(input$tab,{  
      if(input$tab == "results"){
        # callModule(results,"results")
      }
      
      if(input$tab == "classifier"){
         callModule(classifier,"classifier")
      }
      
      })
    
    
})
     
     