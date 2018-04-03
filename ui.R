library(shiny)

data(Titanic)
df <- as.data.frame(Titanic)

  ui <- shinyUI(fluidPage(

    titlePanel("Explore the Titanic Dataset"),

    br(),
    br(),
    
    sidebarLayout(
      sidebarPanel(
        helpText("Use the 3 select menus, then hit submit to determine those passengers' fates."),

        br(),
    
        selectInput( "class", "Class", levels(df[1,1]), "1st"),
        selectInput( "sex", "Sex", levels(df[1,2]), "Male"),
        selectInput( "age", "Age", levels(df[1,3]), "Adult"),
        submitButton("Submit")
      ),
  
    mainPanel(
      p("This dataset provides information on the 2,201 passengers on its fatal maiden voyage."),
      plotOutput('plot')
    )
    )
  ))