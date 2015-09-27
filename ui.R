# wahsabii@gmail.com
shinyUI(pageWithSidebar(
        
        
        headerPanel("", tags$head(  tags$img(src="myImage.png") )  ),
        
        
        wellPanel(
                
                # File Upload Routine
                fileInput('file1', 'STEP A: Please choose your criteria pairwise comparisons in CSV file format from your data stores',
                          accept=c('text/csv', 'text/comma-separated-values,text/plain', '.csv')),
                tags$hr(),
                
                radioButtons('sep', 'STEP B: Please choose a file delimiter (a comma is the default character delimiter)',
                             c(Comma=',',
                               Semicolon=';',
                               Tab='\t'),
                             'Comma'),
                checkboxInput('header', 'Header ', TRUE),
                
                print("Once you successfully execute the Choose File process, for confirmation the pairwise comparison matrix displays below followed by the computed priority vector and inconsistency ratios:")
                
                
        ),
        
        mainPanel(
        
                h4(textOutput('usersDataFileMessage')),
                
                tableOutput('contents'),
                
                h4(textOutput('usersPriorityVectorMessage')),
                
                tableOutput('priorityVector'),
                
                h4(textOutput('usersRatioMessage')),
                
                h5(textOutput('saatyInconsistency')), 
                
                h5(textOutput('koczkodajInconsistency')),
                
                textOutput('referenceEntry1', tags$br),
                
                h4(textOutput('references')),
                
                textOutput('referenceEntry2'),
                
                textOutput('referenceEntry3', tags$br),
                
                textOutput('referenceEntry4')
                
        )
))