# import and clean up data set

usplayerswithsoc <- read.csv("~/GoogleDrive/_SODA/JeopardyDOLData/usplayerswithsoc.csv")

id <- usplayerswithsoc$ID
name <- usplayerswithsoc$name
year <- usplayerswithsoc$year
occ <- usplayerswithsoc$occ
loc <- usplayerswithsoc$loc
numgames <- usplayerswithsoc$numgames
winnings <- usplayerswithsoc$totalwinnings
state <- usplayerswithsoc$state
studentflag <- usplayerswithsoc$studentflag
soc <- usplayerswithsoc$SOC
main <- usplayerswithsoc$main
sub <- usplayerswithsoc$sub


## make a new copy of the data to begin cleaning
## omitting studentflag

cleanplayers <- data.frame(id, name, year, occ, loc, numgames, winnings, state, soc, main, sub)

## begin cleaning

### convert quant vars to numeric
cleanplayers$year <- as.numeric(cleanplayers$year)
cleanplayers$winnings <- as.numeric(cleanplayers$winnings)
cleanplayers$numgames <- as.numeric(cleanplayers$numgames)

### replace bad year values to NA
### there are some invalid years both above and below real dates

cleanplayers$year [cleanplayers$year < 1950] <- NA
cleanplayers$year [cleanplayers$year > 2015] <- NA

### replace other coded missing items as NA
### I'm not doing this for $sub because e.g. 56-9999 would be valid enough

cleanplayers$soc[cleanplayers$soc == ''] <- NA
cleanplayers$main[cleanplayers$main == '9999'] <- NA

## throw out players with missing soc values
## this should nock the total n down to about 5,000.

cleanplayersnoNA <- na.omit(cleanplayers)

## renaming variables 

id <- cleanplayersnoNA$ID
name <- cleanplayersnoNA$name
year <- cleanplayersnoNA$year
occ <- cleanplayersnoNA$occ
loc <- cleanplayersnoNA$loc
numgames <- cleanplayersnoNA$numgames
winnings <- cleanplayersnoNA$totalwinnings
state <- cleanplayersnoNA$state
studentflag <- cleanplayersnoNA$studentflag
soc <- cleanplayersnoNA$soc
main <- cleanplayersnoNA$main
sub <- cleanplayersnoNA$sub

barplot(table(main),cex.axis=0.35)

# take out 2013 players

play2013 <- subset(cleanplayersnoNA, year == 2013)

boxplot(play2013$winnings ~ play2013$main, data = play2013)

barplot(table(play2013$winnings, play2013$main))



