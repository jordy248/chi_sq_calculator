# ui.R

shinyUI(fluidPage(theme = "bootstrap.css",

        #tags$head(
        #        tags$link(rel = "stylesheet", type = "text/css", href = "bootstrap.css")
        #),
        
        sidebarLayout(
                sidebarPanel(
                        h1("Jordy's Chi-Square Test COW-culator"),
                        helpText("Use the calculator below to determine results of your chi-square test"
                        ),
                        img(src="http://media.giphy.com/media/h55EUEsTG9224/giphy.gif", style=
                                    "width:75%; height:75%; align:center;"
                        ),
                        numericInput("panelonec", label = h3("panel 1: # successes"), 
                                value = 5679
                        ), 
                        numericInput("panelonen", label = h3("panel 1: # failures"), 
                                     value = 55204
                        ), 
                        numericInput("paneltwoc", label = h3("panel 2: # successes"), 
                                     value = 6065
                        ), 
                        numericInput("paneltwon", label = h3("panel 2: # failures"), 
                                     value = 56138
                        ), 
                        numericInput("panelthreec", label = h3("panel 3: # successes"), 
                                     value = 0
                        ), 
                        numericInput("panelthreen", label = h3("panel 3: # failures"), 
                                     value = 0
                        ), 
                        numericInput("panelfourc", label = h3("panel 4: # successes"), 
                                     value = 0
                        ), 
                        numericInput("panelfourn", label = h3("panel 4: # failures"), 
                                     value = 0
                        ), 
                        numericInput("panelfivec", label = h3("panel 5: # successes"), 
                                     value = 0
                        ), 
                        numericInput("panelfiven", label = h3("panel 5: # failures"), 
                                     value = 0
                        ),
                        img(src="", style=
                                    "width:75%; height:75%; align:center;"
                        )
                ),
                
                mainPanel(
                        p("Chi-square test x-squared: ", style="font-weight:bold;
                          font-size:2em;"
                        ),
                                h1(strong(textOutput("chi.squared.x.squared"), style="color:blue;")
                                ),
                        br(
                        ),
                        br(
                        ),
                        p("Chi-square test df: ",style="font-weight:bold; font-size:2em;"
                        ),
                                h1(strong(textOutput("chi.squared.df"), style="color:blue;")
                                ),
                        
                        br(
                        ),
                        br(
                        ),
                        p("Chi-square test p-value: ", 
                          style="font-weight:bold; font-size:2em;"
                        ),
                                h1(strong(textOutput("chi.squared.p")), style="color:blue;
                                   background:yellow;"
                                ),
                        p("Chi-squared test significant? ", 
                          style="font-weight:bold; font-size:2em;"
                        ),
                                h1(strong(textOutput("chi.squared.sig")), style="color:blue;"
                        )
                )
        )
))