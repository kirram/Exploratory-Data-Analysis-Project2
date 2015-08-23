plot4<-function(){
  
###Read Data###
  
  data<-readRDS("c:/Users/Kukurill/Documents/GitHub/ExData_Plotting2_Assignment/exdata-data-NEI_data/summarySCC_PM25.rds")
    wiki<-readRDS("c:/Users/Kukurill/Documents/GitHub/ExData_Plotting2_Assignment/exdata-data-NEI_data/Source_Classification_Code.rds")
    
### Coal combustion change ###
    
    data_coal = wiki[grepl("coal", wiki$Short.Name, ignore.case=TRUE),]
    write.csv(data_coal,"c:/Users/Kukurill/Documents/GitHub/ExData_Plotting2_Assignment/coal_data.csv")
    
### Merging
    merge <- merge(x=data, y=data_coal, by="SCC")
      merge2 <- aggregate(merge[, 'Emissions'], by=list(merge$year), sum)
      colnames(merge2) <- c('Year', 'Emissions')
  

    
### Graph ###
    
    plot4<-ggplot(data=merge2, aes(x=Year, y=Emissions/1000)) + 
      geom_line(aes(group=1, col=Emissions)) + geom_point(aes(size=2, col=Emissions)) + 
      ggtitle(expression('Total Emissions of PM'[2.5])) + 
      ylab(expression(paste('PM', ''[2.5], ' in kilotons'))) + 
      geom_text(aes(label=round(Emissions/1000,digits=2), size=2, hjust=1.5, vjust=1.5)) + 
      theme(legend.position='none') + scale_colour_gradient(low='black', high='red')
      print(plot4)
      dev.copy(png,file="c:/Users/Kukurill/Documents/GitHub/ExData_Plotting2_Assignment/Plot4.png", height=700, width=1000)
      dev.off()
      
}