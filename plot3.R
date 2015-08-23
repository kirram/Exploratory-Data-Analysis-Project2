plot3<-function(){
  
###Read Data###
  
  data<-readRDS("c:/Users/Kukurill/Documents/GitHub/ExData_Plotting2_Assignment/exdata-data-NEI_data/summarySCC_PM25.rds")
    wiki<-readRDS("c:/Users/Kukurill/Documents/GitHub/ExData_Plotting2_Assignment/exdata-data-NEI_data/Source_Classification_Code.rds")
    
    Em_Samples<-data[sample(nrow(data), size=2500,replace=FALSE),]
  
### Baltimore_data###
  
  Baltimore_data<-subset(data,fips=="24510")
  Baltimore_data$year<-factor(Baltimore_data$year,levels=c("1999","2002","2005","2008"))
    
    
    
### Graph ###
    
    plot3<-ggplot(data=Baltimore_data,aes(x=year,y=log(Emissions)))+facet_grid(. ~ type) + guides(fill=F) +
      geom_boxplot(aes(fill=type)) + stat_boxplot(geom ='errorbar') +
      ylab(expression(paste('Log', ' of PM'[2.5], ' Emissions'))) + xlab('Year') + 
      ggtitle('Emissions per Type in Baltimore City, Maryland') +
      geom_jitter(alpha=0.10)
      print(plot3)
      dev.copy(png,file="c:/Users/Kukurill/Documents/GitHub/ExData_Plotting2_Assignment/Plot3.png", height=700, width=1000)
      dev.off()
      
}