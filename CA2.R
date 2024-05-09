# Create a dataframe with quality scores for both conditions
Student<-c(1:17)
No_visual_aids<-c(50,60,58,72,36,51,49,49,25,52,41,32,58,39,25,40,61)
With_visual_aids<-c(58,70,60,73,40,63,54,60,29,57,66,37,50,48,80,65,70)
student_data<- data.frame(Student,No_visual_aids,With_visual_aids)
# View the dataframe
student_data
View(student_data)

#structure of dataframe
str(student_data)

# Summary statistics for quality scores without visual aids
summary(student_data$No_visual_aids)

# Summary statistics for quality scores with visual aids
summary(student_data$With_visual_aids)


#Normality Check:
p1<-shapiro.test(student_data$No_visual_aids)
p1
p2<-shapiro.test(student_data$With_visual_aids)
p2

# Histograms for lectures without visual aids
windows(20,16)
par(mfrow=c(1,2))
hist(student_data$No_visual_aids, main="Histogram of Quality Scores without Visual Aids",
     xlab="Quality Score", ylab="Frequency")

# Histograms for lectures with visual aids
hist(student_data$With_visual_aids, main="Histogram of Quality Scores with Visual Aids",
     xlab="Quality Score", ylab="Frequency")

windows(20,16)
par(mfrow=c(1,2))
# QQ plots for lectures without visual aids
qqnorm(student_data$No_visual_aids,main="Without Visual Aids")
qqline(student_data$No_visual_aids)

# QQ plots for lectures with visual aids
qqnorm(student_data$With_visual_aids,main="With Visual Aids")
qqline(student_data$With_visual_aids)
#Boxplot to compare quality scores with and without visual aids
windows(20,16)
boxplot(student_data[,2:3],col = c("blue", "green"), main="Quality Scores with and without Visual Aids", 
        xlab="Visual Aids", ylab="Quality Score", names=c("Without Aids", "With Aids"))

# Paired t-test
t_test <- t.test(student_data$No_visual_aids, student_data$With_visual_aids, paired=TRUE)
t_test




