library(shiny)
library(shinyjs)
library(plotly)
library(shinydashboard)
shinyUI(fluidPage(
    useShinyjs(),
    useShinyalert(),
    extendShinyjs(text = jsResetCode),
    div(id="log_in",log_in_ui()),
    shinyjs::hidden(div(id="portfolio_selection", Portfolio_Input())),
    shinyjs::hidden(div(id="dashBoard",dashboardPage(
            #### Giving CRISIL logo and the link to the website
            #### Shiny Dashboard for UI; So have to follow their API
            
            
            dashboardHeader(dropdownActionMenu(title="Documents",icon=icon("caret-square-o-down"),
                            actionItem("mnuFirst","Application Overview",tabSelect=T,fileName="Approach document for Reducing False Positives.pdf")),
                            title = tags$a(href="https://www.google.com/",   target="_blank",span(img(src="logo.png",width=111,height=55))),
                            tags$li(class="dropdown",tags$a(uiOutput("Logoutpanel")
                                           
                                           )
                                    
                                    )
            ),
            
            dashboardSidebar(width = 200,tags$link(type="text/css",rel="stylesheet",href="sidebar.css"),
                             sidebarMenuOutput("sidebar_in")
                             # sidebarMenu(id="tab",
                             #             icon("file",class = "custom_icon"),
                             #             menuItem("Introduction",tabName = "intro"),
                             # 
                             #             icon("file",class = "custom_icon"),
                             #             menuItem("Data Input",tabName = "fileInput"),
                             #                    #  menuSubItem("Database Connection", tabName = "dbInput")),
                             #             
                             #             icon("pencil",class = "custom_icon"),
                             #             menuItem("Data Analysis", style="border: 2px solid rgb(242,242,244); border-image:none,left:120px;top:-50px;
                             #                      width: 200px;position: relative;background-color:rgb(255,255,255);",
                             #                      menuSubItem("Data Summarization and EDA", tabName = "eda"),
                             #                      menuSubItem("Feature Generation", tabName = "generate_featureUI")
                             #                      ),
                             #             icon("area-chart",class = "custom_icon"),
                             #             menuItem("Modelling", style="border: 2px solid rgb(242,242,244); border-image:none,left:120px;top:-50px;
                             #                      width: 200px;position: relative;background-color:rgb(255,255,255);",
                             #                      menuSubItem("Pre_processing", tabName = "Pre_processing"),
                             #                      menuSubItem("Development", tabName = "modelling")
                             #             ),
                             #             
                             #             icon("bar-chart-o",class = "custom_icon"),
                             #             menuItem("Model Output",tabName = "performanceUI"),
                             #             
                             #             icon("pencil",class = "custom_icon"),
                             #             menuItem("Alert Classifier", tabName = "classifier")
                             # )
        ),
        
        dashboardBody(
            
            #### added custom JS for changing the colour of application to CRISIL colors
            
            tags$div(class="loader_parent",
                     conditionalPanel(condition = "$('html').hasClass('shinybusy')",box(id="loaderBox",width = 12,
                                         tags$div(class="loader",tags$link(type="text/css",rel="stylesheet",href="loader.css"))))),
            tags$link(type="text/css",rel="stylesheet",href="dashboard.css"),
            
            
            tags$script(HTML(
                "document.title='AML Tool';"
            )),
            tabItems(
                
                  tabItem(tabName = "intro",imageInput("image")),
                  tabItem(tabName = "fileInput", readCSVInput("read_csv")),
                 #tabItem(tabName = "dbInput", dbConnectionInput("dbConnect"))#,
                  tabItem(tabName = "eda", edaUI("eda")),
                  tabItem(tabName = "generate_featureUI", generateFeaturesUI("generate_feature")),
                  tabItem(tabName = "Pre_processing", Pre_processingInput("Pre_processing")),
                  tabItem(tabName = "modelling", methodologyInput("methodology")),
                  tabItem(tabName = "performanceUI", performanceUI("performance")),
                # tabItem(tabName = "results",resultsUI("results")),
                  tabItem(tabName = "classifier",classifierUI("classifier"))
            ))
        
        )
        
    )
)
)
)
