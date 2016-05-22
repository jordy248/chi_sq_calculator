# server.R

shinyServer(
        function(input, output) {
                
                output$chi.squared.x.squared <- renderText ({ 
                        
                        matrix.row.one <- c(input$panelonec, input$panelonen)
                        matrix.row.two <- c(input$paneltwoc, input$paneltwon)
                        matrix.row.three <- c(input$panelthreec, input$panelthreen)
                        matrix.row.four <- c(input$panelfourc, input$panelfourn)
                        matrix.row.five <- c(input$panelfivec, input$panelfiven)

                        test.data.frame <- as.data.frame(rbind(matrix.row.one, 
                                                               matrix.row.two, 
                                                               matrix.row.three, 
                                                               matrix.row.four, 
                                                               matrix.row.five))
                        
                        test.data.frame.adj <- test.data.frame[rowSums(test.data.frame) > 0, ]
                        
                        # small cells?
                        small.cells <- length(test.data.frame.adj[test.data.frame.adj < 5])
                        
                        if(small.cells > 0)
                        {
                                p <- fisher.test(test.data.frame.adj)[[3]]
                                
                                return("NA -- Fisher's Exact Test used")  
                        } else 
                        {
                                x.squared <- chisq.test(test.data.frame.adj)[[1]]
                                df <- chisq.test(test.data.frame.adj)[[2]]
                                p <- chisq.test(test.data.frame.adj)[[3]]
                                
                                return(x.squared)  
                        }
                })
                
                output$chi.squared.df <- renderText ({ 
                        
                        matrix.row.one <- c(input$panelonec, input$panelonen)
                        matrix.row.two <- c(input$paneltwoc, input$paneltwon)
                        matrix.row.three <- c(input$panelthreec, input$panelthreen)
                        matrix.row.four <- c(input$panelfourc, input$panelfourn)
                        matrix.row.five <- c(input$panelfivec, input$panelfiven)
                        
                        test.data.frame <- as.data.frame(rbind(matrix.row.one, 
                                                               matrix.row.two, 
                                                               matrix.row.three, 
                                                               matrix.row.four, 
                                                               matrix.row.five))
                        
                        test.data.frame.adj <- test.data.frame[rowSums(test.data.frame) > 0, ]
                        
                        # small cells?
                        small.cells <- length(test.data.frame.adj[test.data.frame.adj < 5])
                        
                        if(small.cells > 0)
                        {
                                p <- fisher.test(test.data.frame.adj)[[3]]
                                
                                return("NA -- Fisher's Exact Test used")  
                        } else 
                        {
                                x.squared <- chisq.test(test.data.frame.adj)[[1]]
                                df <- chisq.test(test.data.frame.adj)[[2]]
                                p <- chisq.test(test.data.frame.adj)[[3]]
                                
                                return(df)  
                        }
                })
                        
                output$chi.squared.p <- renderText ({ 
                        
                        matrix.row.one <- c(input$panelonec, input$panelonen)
                        matrix.row.two <- c(input$paneltwoc, input$paneltwon)
                        matrix.row.three <- c(input$panelthreec, input$panelthreen)
                        matrix.row.four <- c(input$panelfourc, input$panelfourn)
                        matrix.row.five <- c(input$panelfivec, input$panelfiven)
                        
                        test.data.frame <- as.data.frame(rbind(matrix.row.one, 
                                                               matrix.row.two, 
                                                               matrix.row.three, 
                                                               matrix.row.four, 
                                                               matrix.row.five))
                        
                        test.data.frame.adj <- test.data.frame[rowSums(test.data.frame) > 0, ]
                        
                        # small cells?
                        small.cells <- length(test.data.frame.adj[test.data.frame.adj < 5])
                        
                        if(small.cells > 0)
                        {
                                fisher.p <- fisher.test(test.data.frame.adj)[[1]]
                                
                                return(paste0("Fisher's Exact Test used; p = ", fisher.p))  
                        } else 
                        {
                                x.squared <- chisq.test(test.data.frame.adj)[[1]]
                                df <- chisq.test(test.data.frame.adj)[[2]]
                                p <- chisq.test(test.data.frame.adj)[[3]]
                                
                                return(p)  
                        }
                })
                
                output$chi.squared.sig <- renderText ({ 
                        
                        matrix.row.one <- c(input$panelonec, input$panelonen)
                        matrix.row.two <- c(input$paneltwoc, input$paneltwon)
                        matrix.row.three <- c(input$panelthreec, input$panelthreen)
                        matrix.row.four <- c(input$panelfourc, input$panelfourn)
                        matrix.row.five <- c(input$panelfivec, input$panelfiven)
                        
                        test.data.frame <- as.data.frame(rbind(matrix.row.one, 
                                                               matrix.row.two, 
                                                               matrix.row.three, 
                                                               matrix.row.four, 
                                                               matrix.row.five))
                        
                        test.data.frame.adj <- test.data.frame[rowSums(test.data.frame) > 0, ]
                        
                        # small cells?
                        small.cells <- length(test.data.frame.adj[test.data.frame.adj < 5])
                        
                        if(small.cells > 0)
                        {
                                fisher.p <- fisher.test(test.data.frame.adj)[[1]]
                                
                                if(fisher.p < 0.05)
                                {
                                        return(paste0("Fisher's Exact Test used; p = ", fisher.p, "; Yes"))
                                }
                                else if(fisher.p >= 0.05)
                                {
                                        return("No")
                                }
                                
                        } else 
                        {
                                x.squared <- chisq.test(test.data.frame.adj)[[1]]
                                df <- chisq.test(test.data.frame.adj)[[2]]
                                p <- chisq.test(test.data.frame.adj)[[3]]
                                
                                if(p < 0.05)
                                {
                                        return("Yes")
                                }
                                else if(p >= 0.05)
                                {
                                        return("No")
                                }
                        }
                        

                })
                

##                output$cows <- renderText ({
##                        vol <- round(new.power.prop.test(p1 = input$cvr, 
##                                                         p2 = (input$cvr * (1 + (input$mde/100))), 
##                                                         power = input$beta/100, 
##                                                         alternative = "two.sided", 
##                                                         sig.level = ((100-input$alpha)/100)),0
##                        )
##                        c("That's this many cows: ", rep("cows ",vol))
##                })
                
        }
)