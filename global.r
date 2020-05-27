########################################################################
############Project Ttile:Dashboard for Automation L1 Alert############
############Developers:Prithivinath#################################
########### Enter packages and libraries required#######################
###### Packages required#############################

options(java.parameters = "- Xmx1024m")
options(shiny.maxRequestSize=300*1024^2)

require("RSQLite")
require("shiny")
require("DT")
require("imager")
require("shinyjs")
require("shinyWidgets")
require("shinydashboard")
require("shinycssloaders")
require("utils")
require("sqldf")
require("readr")
require("dplyr")
require("neuralnet")
require("deepnet")
require("h2o")
require("corrplot")
require("e1071")
require("reshape2")
require("openxlsx")
require ("party")
require("randomForest")
require("plotly")
require ("caTools") 
require("ROCR")
require("InformationValue")
require("ranger")
require("e1071")
require("tidyr")
require("MASS")
require("AUC")
#require("rJava")
#require("RJDBC")
require("caret")
require("highcharter")
require("shinyalert")


source("www/PortfolioOption/PortfolioUI.R")



#####part of moduldrisation of the code################
  source("www/intro.R")
  source("www/data_load_module.R")
  source("www/login_in_ui.R")
  source("www/eda.R")
  source("www/dbFunctions.R")
  source("www/feature_generation.R")
  source("www/methodology_module.R")
  source("www/Pre-processing.R")
  source("www/performace_metrics.R")
 #### source("www/dbConnectModule.R")
# source("www/report_generation_module.R")
  source("www/methodology_module2.R")
# source("www/results.R")
  source("www/classifier.R")
#########Add the Global variables/objects here. These variables will be availble####
############till the session is active#############################

logged<<-FALSE
final_model<-list()
parms_for_report<<-list()
generate_performance<-FALSE
method_rmd<<-c()
check<<-c()
temp<<-c()
username<<-"system"
password<<-"Crisil@123"
classpath<<-"D:/sqldeveloper/jdbc/lib/ojdbc7.jar"
jsResetCode <- "shinyjs.reset = function() {history.go(0)}"




dropdownActionMenu <- function (..., title=NULL, icon = NULL, .list = NULL, header=NULL) {
  
  items <- c(list(...), .list)
  lapply(items, shinydashboard:::tagAssert, type = "li")
  type <- "notifications"
  dropdownClass <- paste0("dropdown ", type, "-menu")
  tags$li(class = dropdownClass, a(href = "#", class = "dropdown-toggle",
                                   `data-toggle` = "dropdown", icon, title), tags$ul(class = "dropdown-menu",
                                                                                     if(!is.null(header)) tags$li(class="header",header),
                                                                                     tags$li(tags$ul(class = "menu", items))))
}

actionItem = function (inputId, text, icon = NULL, tabSelect=FALSE, fileName = NULL) {
  if(!is.null(icon)) {
    shinydashboard:::tagAssert(icon, type = "i")
    icon <- tagAppendAttributes(icon, class = paste0("text-", "success"))
  }
  if(tabSelect) {
    tags$li(a(onclick=paste0("shinyjs.tabSelect('",inputId,"')"),icon,text,target="_blank",href=fileName))
  } else {
    tags$li(actionLink(inputId,text,icon))
  }
}