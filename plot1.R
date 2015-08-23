plot1<-function(){
  
###Read Data###
  
  data<-readRDS("c:/Users/Kukurill/Documents/GitHub/ExData_Plotting2_Assignment/exdata-data-NEI_data/summarySCC_PM25.rds")
  wiki<-readRDS("c:/Users/Kukurill/Documents/GitHub/ExData_Plotting2_Assignment/exdata-data-NEI_data/Source_Classification_Code.rds")
  
  Em_Samples<-data[sample(nrow(data), size=2500,replace=FALSE),]
  
  data1<-aggregate(data[,"Emissions"],by=list(data$year), FUN=sum)
  data1$PM<-round(data1[,2]/1000,2)
                     
### Graph ###
                     
barplot(data1$PM, names.arg=data1$Group.1,main=expression("Total Emission of PM"[2.5]), xlab="Year", ylab=expression(paste("PM","[2.5]", " in Kilotons")))
  
  dev.copy(png,file="c:/Users/Kukurill/Documents/GitHub/ExData_Plotting2_Assignment/Plot1.png", height=480, width=480)
  dev.off()
  
}