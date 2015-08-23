plot5<-function(){
  
###Read Data###
  
  data<-readRDS("c:/Users/Kukurill/Documents/GitHub/ExData_Plotting2_Assignment/exdata-data-NEI_data/summarySCC_PM25.rds")
    wiki<-readRDS("c:/Users/Kukurill/Documents/GitHub/ExData_Plotting2_Assignment/exdata-data-NEI_data/Source_Classification_Code.rds")
    
    Em_Samples<-data[sample(nrow(data), size=2500,replace=FALSE),]
  
### Baltimore_data###
  
    data$year<-factor(data$year,levels=c("1999","2002","2005","2008"))
    Baltimore_data_onroad <- subset(data, fips == 24510 & type == "ON-ROAD")

    Baltimore_data1 <- aggregate(Baltimore_data_onroad[, 'Emissions'], by=list(Baltimore_data_onroad$year), sum)
      colnames(Baltimore_data1) <- c("year", "Emissions")
      
    
    
    
### Graph ###
    library(ggplot2)
    plot5<-ggplot(data=Baltimore_data1,aes(x=year,y=Emissions))+geom_bar(aes(fill=year), stat="identity") + guides(fill=FALSE) + 
      ggtitle('Total Emissions of Motor Vehicle Sources in Baltimore City, Maryland') + 
      ylab(expression('PM'[2.5])) + xlab('Year') + theme(legend.position='none') + 
      geom_text(aes(label=round(Emissions,0), size=1, hjust=0.5, vjust=2))
      print(plot5)
      dev.copy(png,file="c:/Users/Kukurill/Documents/GitHub/ExData_Plotting2_Assignment/Plot5.png", height=700, width=1000)
      dev.off()
      
}