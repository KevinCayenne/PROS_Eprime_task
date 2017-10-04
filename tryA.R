setwd("C:/Users/acer/Desktop/MyProject/Task_Program")

# try.1 <- data.frame(read.csv("ZY_FormalRun_1_1_1_1.csv"))
try.1 <- data.frame(read.csv("ZY_FormalRun_1_1_1_1.csv"))

ncoltry.1 <- ncol(try.1) #計算column number

for (i in c(1:nrow(try.1))){
try.1[i, ncoltry.1+1] <- try.1[i, 12] - try.1[i, 11] # MDRT  - MDFirstP = 給錢情境的反應時間 ( 12 - 11 ) 
try.1[i, ncoltry.1+2] <- try.1[i, 15] - try.1[i, 14] # EmoRT - EFirstP = 情緒反應的反應時間 ( 15 - 14 )
try.1[i, ncoltry.1+3] <- try.1[i, 27] - try.1[i, 22] # TrialEnd - fixOnsettime  = ITI duration = ITI ( 27 - 22 )
try.1[i, ncoltry.1+4] <- try.1[i, 24] - try.1[i, 23] # ISIstart - MDOnsettime = 給錢情境的duraiton ( 24 - 23 )
try.1[i, ncoltry.1+5] <- try.1[i, 25] - try.1[i, 24] # EmoOnsettime  - ISIstart = ISI duration = ISI ( 25 - 24 )
try.1[i, ncoltry.1+6] <- try.1[i, 26] - try.1[i, 25] # EmoEndtime - EmoOnsettime = 情緒選擇的duration ( 26 - 25 )
try.1[i, ncoltry.1+7] <- try.1[i, 27] - try.1[i,  5] # TrialEnd - TriggerS = 從Trigger開始到當前Trial結束的時間 ( 27 - 5 )

if (i >= 2){ 
  try.1[i, ncoltry.1+8] <- try.1[i, ncoltry.1+7] - try.1[(i-1), ncoltry.1+7] #一個Trial的總時間
}
}

for (i in c(1:nrow(try.1))){
try.1[i, ncoltry.1+9] <- try.1[i, 21] - try.1[i, 5] #LongFixation總時間( 21 -5 )
try.1[i, ncoltry.1+10] <- try.1[i, 19] + try.1[i, 20] + 24000 #default duartion per trial =  try.1[i, ncoltry.1+8]
}
try.1[1, ncoltry.1+8] <- try.1[1, ncoltry.1+7] - try.1[1, ncoltry.1+9] #第一個Trial的總時間
colnames(try.1)[(ncoltry.1+1):(ncoltry.1+10)] <- c("MoneyD_RT", "EmoD_RT", "ITI_D", "MoneyD", "ISI_D","EmoD","DTriggerOnset","TrialD","LongD","DefaultT")
# adding tags

