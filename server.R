# wahsabii@gmail.com
library(shiny)
library(pmr)

shinyServer(function(input, output) {

        output$priorityVector <- renderTable({
                
                # input$file1 will be NULL initially. After the user selects and uploads a 
                # file, it will be a data frame with 'name', 'size', 'type', and 'datapath' 
                # columns. The 'datapath' column will contain the local filenames where the 
                # data can be found.
                
                inFile <- input$file1
                
                if (is.null(inFile))
                        return(NULL)
                
                # Please check a_{ij} = 1/a_{ji} error; otherwise, will not compute
                myData <- read.csv(inFile$datapath, header=input$header, sep=input$sep)
                
                # pmr::ahp function requires a matrix; covert dataframe to a matrix
                A <- as.matrix(apply(myData[,-1],2,as.numeric))  # Don't load the row names because of matrix
                # add the row names
                row.names(A) <- myData[,1]  # Now add the row names
                
                R <- ahp(A) # calculate the criteria ranking using AHP in the pmr package  
                
                # Convert matrix output R into a data frame
                iterations = length(R$weighting)  # calc number of criteria to use in a for loop
                variables = 2  # calc for two columns in data frame build, criteria and rank
                myAnswer <- matrix(ncol=variables, nrow=iterations) # Build the priority vector framework 
                myAnswer <- as.data.frame(myAnswer) # Convert matrix to data frame
                
                for(i in 1:iterations){ # Build the priority vector
                        myAnswer[i,] <- c(as.character(row.names(A)[i]),round(R$weighting[i],2))
                }
                
                colnames(myAnswer) <- c("criteria", "rank")  # add the column headings
                
                ###############################  Build the Output ###############################
                
                output$usersDataFileMessage <-renderText("You entered the following pairwise comparison matrix (you may have to select an appropriate delimiter in Step 2 above: ")
                
                output$contents <- renderTable({
                        
                        # input$file1 will be NULL initially. After the user selects and uploads a 
                        # file, it will be a data frame with 'name', 'size', 'type', and 'datapath' 
                        # columns. The 'datapath' column will contain the local filenames where the 
                        # data can be found.
                        
                        inFile <- input$file1
                        
                        if (is.null(inFile))
                                return(NULL)
                        
                        read.csv(inFile$datapath, header=input$header, sep=input$sep )
                })
                
                output$usersPriorityVectorMessage <- renderText("The priority vector is: ")
                
                output$usersRatioMessage <- renderText("The inconsistency ratios are as follows: ")
                
                output$saatyInconsistency <- renderText({paste("Saaty's ratio: ",round(R$Saaty,4))})
                
                output$koczkodajInconsistency <- renderText({paste("Koczkodaj's ratio: ",round(R$Koczkodaj,4))})
                
                output$references <- renderText("References  ")
                
                output$referenceEntry1 <- renderText("  ")
                
                output$referenceEntry2 <- renderText("Analytic hierarchy process. (2015). Retrieved September 19, 2015 from https://en.wikipedia.org/wiki/Analytic_hierarchy_process.  ")
                
                output$referenceEntry3 <- renderText("  ")
                
                output$referenceEntry4 <- renderText("Saaty, Thomas L. (2012). Decision making for leaders: the analytic hierarchy process for decisions in a complex world. RWS Publications. Kindle Edition.  ")
                
                myOrder <- order(myAnswer$rank, decreasing=TRUE) # Order the data frame in decending order
                
                myAnswer[myOrder,] # Return the prioirtyVector
                
        })
        

        

})