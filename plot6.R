plot6<-function(){
  
###Read Data###
  
  data<-readRDS("c:/Users/Kukurill/Documents/GitHub/ExData_Plotting2_Assignment/exdata-data-NEI_data/summarySCC_PM25.rds")
    wiki<-readRDS("c:/Users/Kukurill/Documents/GitHub/ExData_Plotting2_Assignment/exdata-data-NEI_data/Source_Classification_Code.rds")
    
    Em_Samples<-data[sample(nrow(data), size=2500,replace=FALSE),]
  
### Baltimore_data###
  
  data$year<-factor(data$year,levels=c("1999","2002","2005","2008"))
    Baltimore_data_onroad <- subset(data, fips == "24510" & type == "ON-ROAD")
    LA_data_onroad <- subset(data, fips == "06037" & type == "ON-ROAD")
    
    write.csv(Baltimore_data_onroad,"c:/Users/Kukurill/Documents/GitHub/ExData_Plotting2_Assignment/Baltimore_data.csv")
    write.csv(LA_data_onroad,"c:/Users/Kukurill/Documents/GitHub/ExData_Plotting2_Assignment/LA_data.csv")
    
    
    Baltimore_data1 <- aggregate(Baltimore_data_onroad[, 'Emissions'], by=list(Baltimore_data_onroad$year), sum)
    colnames(Baltimore_data1) <- c("year", "Emissions")
    Baltimore_data1$City<-paste(rep("Baltimore",4))
    
    
    LA_data1 <- aggregate(LA_data_onroad[, 'Emissions'], by=list(LA_data_onroad$year), sum)
    colnames(LA_data1) <- c("year", "Emissions")
    LA_data1$City<-paste(rep("LA",4))
    
    data2 <- as.data.frame(rbind(Baltimore_data1, LA_data1))
    
    
    
    
### Graph ###
    library(ggplot2)
      plot6<-ggplot(data=data2,aes(x=year,y=Emissions))+geom_bar(aes(fill=year), stat="identity") + guides(fill=FALSE) + 
        ggtitle("Total Emissions of Motor Vehicle Sources\nLos Angeles County, California vs. Baltimore City, Maryland") + 
        ylab(expression("PM"[2.5])) + xlab("Year") + theme(legend.position="none") + facet_grid(. ~ City) + 
        geom_text(aes(label=round(Emissions,0), size=1, hjust=0.5, vjust=-1))
      print(plot6)
      dev.copy(png,file="c:/Users/Kukurill/Documents/GitHub/ExData_Plotting2_Assignment/Plot6.png", height=700, width=1000)
      dev.off()
      
}