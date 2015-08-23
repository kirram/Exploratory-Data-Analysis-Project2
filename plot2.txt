plot2<-function(){
  
###Read Data###
  
  data<-readRDS("c:/Users/Kukurill/Documents/GitHub/ExData_Plotting2_Assignment/exdata-data-NEI_data/summarySCC_PM25.rds")
    wiki<-readRDS("c:/Users/Kukurill/Documents/GitHub/ExData_Plotting2_Assignment/exdata-data-NEI_data/Source_Classification_Code.rds")
    
    Em_Samples<-data[sample(nrow(data), size=2500,replace=FALSE),]
  
### Baltimore_data###
  
  Baltimore_data<-subset(data,fips=="24510")
    
    
    
### Graph ###
    
    barplot(tapply(X=Baltimore_data$Emissions,INDEX=Baltimore_data$year, FUN=sum),main="Total Emission in Baltimore city", xlab="Year", ylab=expression(paste("PM","[2.5]")))
      
      dev.copy(png,file="c:/Users/Kukurill/Documents/GitHub/ExData_Plotting2_Assignment/Plot2.png", height=480, width=480)
      dev.off()
              
}