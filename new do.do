*TO reader, change cd before 475, the code should work perfectly
clear all
cd "C:\Users\Anson\Documents\475 reference"

*Impott police data
*FRom police report

*Import background
clear all 

*Show there will be no will change



*Import Holiday
clear all
 import delimited "Bulk weather\holiday.csv"
drop v1 v3
drop if _n==1
rename v2 date
split date, p("-")
drop date
rename date1 year
rename date2 month
rename date3 day
destring day,replace
destring month,replace
destring year,replace
 gen edate = mdy(month, day, year)
  sort edate
 gen holiday=1
drop year month day
quietly by edate:  gen dup = cond(_N==1,0,_n)
drop if dup>1
drop dup
save "holiday.dta",replace
clear all
import delimited "Bulk weather\2062980.csv"
keep date wesd tmax tmin snow snwd prcp awnd
split date, p("-")
drop date
rename date1 year
rename date2 month
rename date3 day
destring day,replace
destring month,replace
destring year,replace
 gen edate = mdy(month, day, year)
  sort edate
*awnd
gen measure=1 if awnd!=.
 replace measure=0 if awnd==.
egen Sum=sum(awnd) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgawnd=Sum/Den
drop Sum Den awnd measure

*prcp
gen measure=1 if prcp!=.
 replace measure=0 if prcp==.
egen Sum=sum(prcp) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgprcp=Sum/Den 
drop Sum Den prcp measure

*wesd
gen measure=1 if wesd!=.
 replace measure=0 if wesd==.
egen Sum=sum(wesd) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgwesd=Sum/Den 
drop Sum Den wesd measure
*tmax
gen measure=1 if tmax!=.
 replace measure=0 if tmax==.
egen Sum=sum(tmax) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgtmax=Sum/Den 
drop Sum Den tmax measure
*tmin
gen measure=1 if tmin!=.
 replace measure=0 if tmin==.
egen Sum=sum(tmin) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgtmin=Sum/Den 
drop Sum Den tmin measure
*snow
gen measure=1 if snow!=.
 replace measure=0 if snow==.
egen Sum=sum(snow) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgsnow=Sum/Den 
drop Sum Den snow measure
*snwd
gen measure=1 if snwd!=.
 replace measure=0 if snwd==.
egen Sum=sum(snwd) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgsnwd=Sum/Den 
drop Sum Den snwd measure
save "Bulk weather\01-02.dta",replace
clear all
import delimited "Bulk weather\2062986.csv"
keep date wesd tmax tmin snow snwd prcp awnd
split date, p("-")
drop date
rename date1 year
rename date2 month
rename date3 day
destring day,replace
destring month,replace
destring year,replace
 gen edate = mdy(month, day, year)
  sort edate
*awnd
gen measure=1 if awnd!=.
 replace measure=0 if awnd==.
egen Sum=sum(awnd) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgawnd=Sum/Den
drop Sum Den awnd measure

*prcp
gen measure=1 if prcp!=.
 replace measure=0 if prcp==.
egen Sum=sum(prcp) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgprcp=Sum/Den 
drop Sum Den prcp measure

*wesd
gen measure=1 if wesd!=.
 replace measure=0 if wesd==.
egen Sum=sum(wesd) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgwesd=Sum/Den 
drop Sum Den wesd measure
*tmax
gen measure=1 if tmax!=.
 replace measure=0 if tmax==.
egen Sum=sum(tmax) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgtmax=Sum/Den 
drop Sum Den tmax measure
*tmin
gen measure=1 if tmin!=.
 replace measure=0 if tmin==.
egen Sum=sum(tmin) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgtmin=Sum/Den 
drop Sum Den tmin measure
*snow
gen measure=1 if snow!=.
 replace measure=0 if snow==.
egen Sum=sum(snow) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgsnow=Sum/Den 
drop Sum Den snow measure
*snwd
gen measure=1 if snwd!=.
 replace measure=0 if snwd==.
egen Sum=sum(snwd) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgsnwd=Sum/Den 
drop Sum Den snwd measure

save "Bulk weather\03-04.dta",replace
clear all
import delimited "Bulk weather\2062987 (1).csv"
keep date wesd tmax tmin snow snwd prcp awnd
split date, p("-")
drop date
rename date1 year
rename date2 month
rename date3 day
destring day,replace
destring month,replace
destring year,replace
 gen edate = mdy(month, day, year)
  sort edate
*awnd
gen measure=1 if awnd!=.
 replace measure=0 if awnd==.
egen Sum=sum(awnd) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgawnd=Sum/Den
drop Sum Den awnd measure

*prcp
gen measure=1 if prcp!=.
 replace measure=0 if prcp==.
egen Sum=sum(prcp) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgprcp=Sum/Den 
drop Sum Den prcp measure

*wesd
gen measure=1 if wesd!=.
 replace measure=0 if wesd==.
egen Sum=sum(wesd) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgwesd=Sum/Den 
drop Sum Den wesd measure
*tmax
gen measure=1 if tmax!=.
 replace measure=0 if tmax==.
egen Sum=sum(tmax) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgtmax=Sum/Den 
drop Sum Den tmax measure
*tmin
gen measure=1 if tmin!=.
 replace measure=0 if tmin==.
egen Sum=sum(tmin) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgtmin=Sum/Den 
drop Sum Den tmin measure
*snow
gen measure=1 if snow!=.
 replace measure=0 if snow==.
egen Sum=sum(snow) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgsnow=Sum/Den 
drop Sum Den snow measure
*snwd
gen measure=1 if snwd!=.
 replace measure=0 if snwd==.
egen Sum=sum(snwd) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgsnwd=Sum/Den 
drop Sum Den snwd measure
save "Bulk weather\05-06.dta",replace
clear all
import delimited "Bulk weather\2062991.csv"
keep date wesd tmax tmin snow snwd prcp awnd
split date, p("-")
drop date
rename date1 year
rename date2 month
rename date3 day
destring day,replace
destring month,replace
destring year,replace
 gen edate = mdy(month, day, year)
  sort edate

*awnd
gen measure=1 if awnd!=.
 replace measure=0 if awnd==.
egen Sum=sum(awnd) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgawnd=Sum/Den
drop Sum Den awnd measure

*prcp
gen measure=1 if prcp!=.
 replace measure=0 if prcp==.
egen Sum=sum(prcp) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgprcp=Sum/Den 
drop Sum Den prcp measure

*wesd
gen measure=1 if wesd!=.
 replace measure=0 if wesd==.
egen Sum=sum(wesd) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgwesd=Sum/Den 
drop Sum Den wesd measure
*tmax
gen measure=1 if tmax!=.
 replace measure=0 if tmax==.
egen Sum=sum(tmax) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgtmax=Sum/Den 
drop Sum Den tmax measure
*tmin
gen measure=1 if tmin!=.
 replace measure=0 if tmin==.
egen Sum=sum(tmin) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgtmin=Sum/Den 
drop Sum Den tmin measure
*snow
gen measure=1 if snow!=.
 replace measure=0 if snow==.
egen Sum=sum(snow) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgsnow=Sum/Den 
drop Sum Den snow measure
*snwd
gen measure=1 if snwd!=.
 replace measure=0 if snwd==.
egen Sum=sum(snwd) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgsnwd=Sum/Den 
drop Sum Den snwd measure
save "Bulk weather\07-08.dta",replace
clear all
import delimited "Bulk weather\2062994.csv"
keep date wesd tmax tmin snow snwd prcp awnd
split date, p("-")
drop date
rename date1 year
rename date2 month
rename date3 day
destring day,replace
destring month,replace
destring year,replace
 gen edate = mdy(month, day, year)
  sort edate
*awnd
gen measure=1 if awnd!=.
 replace measure=0 if awnd==.
egen Sum=sum(awnd) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgawnd=Sum/Den
drop Sum Den awnd measure

*prcp
gen measure=1 if prcp!=.
 replace measure=0 if prcp==.
egen Sum=sum(prcp) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgprcp=Sum/Den 
drop Sum Den prcp measure

*wesd
gen measure=1 if wesd!=.
 replace measure=0 if wesd==.
egen Sum=sum(wesd) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgwesd=Sum/Den 
drop Sum Den wesd measure
*tmax
gen measure=1 if tmax!=.
 replace measure=0 if tmax==.
egen Sum=sum(tmax) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgtmax=Sum/Den 
drop Sum Den tmax measure
*tmin
gen measure=1 if tmin!=.
 replace measure=0 if tmin==.
egen Sum=sum(tmin) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgtmin=Sum/Den 
drop Sum Den tmin measure
*snow
gen measure=1 if snow!=.
 replace measure=0 if snow==.
egen Sum=sum(snow) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgsnow=Sum/Den 
drop Sum Den snow measure
*snwd
gen measure=1 if snwd!=.
 replace measure=0 if snwd==.
egen Sum=sum(snwd) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgsnwd=Sum/Den 
drop Sum Den snwd measure
save "Bulk weather\09-10.dta",replace
clear all
import delimited "Bulk weather\2062996.csv"
keep date wesd tmax tmin snow snwd prcp awnd
split date, p("-")
drop date
rename date1 year
rename date2 month
rename date3 day
destring day,replace
destring month,replace
destring year,replace
 gen edate = mdy(month, day, year)
  sort edate
*awnd
gen measure=1 if awnd!=.
 replace measure=0 if awnd==.
egen Sum=sum(awnd) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgawnd=Sum/Den
drop Sum Den awnd measure

*prcp
gen measure=1 if prcp!=.
 replace measure=0 if prcp==.
egen Sum=sum(prcp) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgprcp=Sum/Den 
drop Sum Den prcp measure

*wesd
gen measure=1 if wesd!=.
 replace measure=0 if wesd==.
egen Sum=sum(wesd) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgwesd=Sum/Den 
drop Sum Den wesd measure
*tmax
gen measure=1 if tmax!=.
 replace measure=0 if tmax==.
egen Sum=sum(tmax) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgtmax=Sum/Den 
drop Sum Den tmax measure
*tmin
gen measure=1 if tmin!=.
 replace measure=0 if tmin==.
egen Sum=sum(tmin) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgtmin=Sum/Den 
drop Sum Den tmin measure
*snow
gen measure=1 if snow!=.
 replace measure=0 if snow==.
egen Sum=sum(snow) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgsnow=Sum/Den 
drop Sum Den snow measure
*snwd
gen measure=1 if snwd!=.
 replace measure=0 if snwd==.
egen Sum=sum(snwd) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgsnwd=Sum/Den 
drop Sum Den snwd measure
save "Bulk weather\11-12.dta",replace
clear all
import delimited "Bulk weather\2062999.csv"
keep date wesd tmax tmin snow snwd prcp awnd
split date, p("-")
drop date
rename date1 year
rename date2 month
rename date3 day
destring day,replace
destring month,replace
destring year,replace
 gen edate = mdy(month, day, year)
  sort edate
*awnd
gen measure=1 if awnd!=.
 replace measure=0 if awnd==.
egen Sum=sum(awnd) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgawnd=Sum/Den
drop Sum Den awnd measure

*prcp
gen measure=1 if prcp!=.
 replace measure=0 if prcp==.
egen Sum=sum(prcp) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgprcp=Sum/Den 
drop Sum Den prcp measure

*wesd
gen measure=1 if wesd!=.
 replace measure=0 if wesd==.
egen Sum=sum(wesd) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgwesd=Sum/Den 
drop Sum Den wesd measure
*tmax
gen measure=1 if tmax!=.
 replace measure=0 if tmax==.
egen Sum=sum(tmax) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgtmax=Sum/Den 
drop Sum Den tmax measure
*tmin
gen measure=1 if tmin!=.
 replace measure=0 if tmin==.
egen Sum=sum(tmin) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgtmin=Sum/Den 
drop Sum Den tmin measure
*snow
gen measure=1 if snow!=.
 replace measure=0 if snow==.
egen Sum=sum(snow) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgsnow=Sum/Den 
drop Sum Den snow measure
*snwd
gen measure=1 if snwd!=.
 replace measure=0 if snwd==.
egen Sum=sum(snwd) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgsnwd=Sum/Den 
drop Sum Den snwd measure
save "Bulk weather\13-14.dta",replace
clear all
import delimited "Bulk weather\2063000.csv"
keep date wesd tmax tmin snow snwd prcp awnd
split date, p("-")
drop date
rename date1 year
rename date2 month
rename date3 day
destring day,replace
destring month,replace
destring year,replace
 gen edate = mdy(month, day, year)
  sort edate
*awnd
gen measure=1 if awnd!=.
 replace measure=0 if awnd==.
egen Sum=sum(awnd) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgawnd=Sum/Den
drop Sum Den awnd measure

*prcp
gen measure=1 if prcp!=.
 replace measure=0 if prcp==.
egen Sum=sum(prcp) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgprcp=Sum/Den 
drop Sum Den prcp measure

*wesd
gen measure=1 if wesd!=.
 replace measure=0 if wesd==.
egen Sum=sum(wesd) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgwesd=Sum/Den 
drop Sum Den wesd measure
*tmax
gen measure=1 if tmax!=.
 replace measure=0 if tmax==.
egen Sum=sum(tmax) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgtmax=Sum/Den 
drop Sum Den tmax measure
*tmin
gen measure=1 if tmin!=.
 replace measure=0 if tmin==.
egen Sum=sum(tmin) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgtmin=Sum/Den 
drop Sum Den tmin measure
*snow
gen measure=1 if snow!=.
 replace measure=0 if snow==.
egen Sum=sum(snow) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgsnow=Sum/Den 
drop Sum Den snow measure
*snwd
gen measure=1 if snwd!=.
 replace measure=0 if snwd==.
egen Sum=sum(snwd) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgsnwd=Sum/Den 
drop Sum Den snwd measure

save "Bulk weather\15-16.dta",replace
clear all
import delimited "Bulk weather\2063002.csv"
keep date wesd tmax tmin snow snwd prcp awnd
split date, p("-")
drop date
rename date1 year
rename date2 month
rename date3 day
destring day,replace
destring month,replace
destring year,replace
 gen edate = mdy(month, day, year)
  sort edate
*awnd
gen measure=1 if awnd!=.
 replace measure=0 if awnd==.
egen Sum=sum(awnd) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgawnd=Sum/Den
drop Sum Den awnd measure

*prcp
gen measure=1 if prcp!=.
 replace measure=0 if prcp==.
egen Sum=sum(prcp) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgprcp=Sum/Den 
drop Sum Den prcp measure

*wesd
gen measure=1 if wesd!=.
 replace measure=0 if wesd==.
egen Sum=sum(wesd) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgwesd=Sum/Den 
drop Sum Den wesd measure
*tmax
gen measure=1 if tmax!=.
 replace measure=0 if tmax==.
egen Sum=sum(tmax) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgtmax=Sum/Den 
drop Sum Den tmax measure
*tmin
gen measure=1 if tmin!=.
 replace measure=0 if tmin==.
egen Sum=sum(tmin) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgtmin=Sum/Den 
drop Sum Den tmin measure
*snow
gen measure=1 if snow!=.
 replace measure=0 if snow==.
egen Sum=sum(snow) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgsnow=Sum/Den 
drop Sum Den snow measure
*snwd
gen measure=1 if snwd!=.
 replace measure=0 if snwd==.
egen Sum=sum(snwd) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgsnwd=Sum/Den 
drop Sum Den snwd measure
save "Bulk weather\17-18.dta",replace
clear all
import delimited "Bulk weather\2063004.csv"
keep date wesd tmax tmin snow snwd prcp awnd
split date, p("-")
drop date
rename date1 year
rename date2 month
rename date3 day
destring day,replace
destring month,replace
destring year,replace
 gen edate = mdy(month, day, year)
  sort edate
*awnd
gen measure=1 if awnd!=.
 replace measure=0 if awnd==.
egen Sum=sum(awnd) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgawnd=Sum/Den
drop Sum Den awnd measure

*prcp
gen measure=1 if prcp!=.
 replace measure=0 if prcp==.
egen Sum=sum(prcp) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgprcp=Sum/Den 
drop Sum Den prcp measure

*wesd
gen measure=1 if wesd!=.
 replace measure=0 if wesd==.
egen Sum=sum(wesd) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgwesd=Sum/Den 
drop Sum Den wesd measure
*tmax
gen measure=1 if tmax!=.
 replace measure=0 if tmax==.
egen Sum=sum(tmax) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgtmax=Sum/Den 
drop Sum Den tmax measure
*tmin
gen measure=1 if tmin!=.
 replace measure=0 if tmin==.
egen Sum=sum(tmin) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgtmin=Sum/Den 
drop Sum Den tmin measure
*snow
gen measure=1 if snow!=.
 replace measure=0 if snow==.
egen Sum=sum(snow) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgsnow=Sum/Den 
drop Sum Den snow measure
*snwd
gen measure=1 if snwd!=.
 replace measure=0 if snwd==.
egen Sum=sum(snwd) , by(edate)
egen Den=sum(measure) , by(edate)
gen avgsnwd=Sum/Den 
drop Sum Den snwd measure

save "Bulk weather\19-20.dta",replace
*merge
clear all
use "Bulk weather\01-02.dta"
append using "Bulk weather\03-04.dta"
append using "Bulk weather\05-06.dta"
append using "Bulk weather\07-08.dta"
append using "Bulk weather\09-10.dta"
append using "Bulk weather\11-12.dta"
append using "Bulk weather\13-14.dta"
append using "Bulk weather\15-16.dta"
append using "Bulk weather\17-18.dta"
append using "Bulk weather\19-20.dta"
sort edate

*Check is any day without data
generate missing=1 if avgwesd==.| avgtmax==.| avgtmin==.| avgsnow==. |avgsnwd==.| avgprcp==.
generate Good=1 if missing!=1
egen OBS=sum(Good), by(edate)
generate problem=1 if OBS<1
quietly by edate:  gen dup = cond(_N==1,0,_n)
drop if dup>1
drop dup OBS Good missing
save "Bulk weather\weather done.dta",replace

*Crime data
clear all
import delimited "Crimes_-_2001_to_present.csv"
drop id casenumber block iucr description locationdescription arrest domestic beat ward communityarea fbicode xcoordinate ycoordinate updatedon latitude longitude location
save "crime data.dta",replace
split date, p(/)
gen date5=substr(date3,1,4)
drop date3 year
 rename date2 day

rename date1 month

rename date5 year
destring day,replace
destring month,replace
destring year,replace
drop date
 gen edate = mdy(month, day, year)
 gen crime=1
 egen crime_count=total(crime), by(edate)
sort edate
quietly by edate :  gen dup = cond(_N==1,0,_n)
gen violent=1 if primarytype=="ARSON"|primarytype=="BATTERY"|primarytype=="CRIMINAL DAMAGE"|primarytype=="ASSAULT"|primarytype=="ROBBERY"|primarytype=="CRIMINAL TRESPASS"|primarytype=="WEAPONS VIOLATION"|primarytype=="PUBLIC PEACE VIOLATION"|primarytype=="CRIM SEXUAL ASSAULT"|primarytype=="SEX OFFENSE"|primarytype=="INTERFERENCE WITH PUBLIC OFFICER"|primarytype=="HOMICIDE"|primarytype=="KIDNAPPING"
replace violent=0 if violent==.
 egen violent_count=total(violent), by(edate)
generate trust=1 if primarytype=="DECEPTIVE PRACTICE"
replace trust=0 if trust==.
 egen trust_count=total(trust), by(edate)
gen Theft=1 if primarytype=="THEFT"|primarytype=="MOTOR VEHICLE THEFT"|primarytype=="BURGLARY"
replace Theft=0 if Theft==.
 egen Theft_count=total(Theft), by(edate)
gen drug=1 if primarytype=="NARCOTICS"
replace drug=0 if drug==.
 egen drug_count=total(drug), by(edate)
gen sex=1 if primarytype=="PROSTITUTION"|primarytype=="CRIM SEXUAL ASSAULT"|primarytype=="SEX OFFENSE"
replace sex=0 if sex==.
 egen sex_count=total(sex), by(edate)
 gen children=1 if primarytype=="OFFENSE INVOLVING CHILDREN"
replace children=0 if children==.
 egen children_count=total(children), by(edate)
 gen game=1 if primarytype=="GAMBLING"
replace game=0 if game==.
 egen game_count=total(game), by(edate)
 drop primarytype crime violent trust Theft drug sex children game
drop if dup>1
drop dup district


merge 1:1 edate using "Bulk weather\weather done.dta"
rename _merge check
save "crime and weather.dta",replace
clear all
use "holiday.dta"
merge 1:1 edate using "crime and weather.dta"

replace holiday=0 if holiday!=1
save "crime data.dta",replace
count if problem==1

clear all
use "crime data.dta"
format edate %td
drop if _merge==1
replace avgwesd=0 if avgwesd==.
tsset edate
*graph
twoway (tsline avgtmax)
twoway (tsline crime_count)

varsoc avgtmax, exog( edate)
varsoc crime_count, exog( edate)
varsoc violent_count, exog( edate)
varsoc trust_count, exog( edate)
varsoc Theft_count, exog( edate)
varsoc drug_count, exog( edate)
varsoc sex_count, exog( edate)
varsoc children_count, exog( edate)
varsoc game_count, exog( edate)
varsoc avgawnd, exog( edate)
varsoc avgprcp, exog(edate)
varsoc avgwesd, exog(edate)
varsoc avgtmin, exog(edate)
varsoc avgsnow, exog(edate)
varsoc avgsnwd, exog(edate)


*Test for stationary
dfuller avgtmax,lag(2)
dfuller crime_count,lag(3) trend
dfuller violent_count,lag(3) trend
dfuller trust_count,lag(3) trend
dfuller Theft_count,lag(3) trend
dfuller drug_count,lag(3) trend
dfuller sex_count,lag(3) trend
dfuller game_count,lag(3) trend
dfuller avgawnd,lag(3) trend
dfuller avgprcp,lag(1) trend
dfuller avgwesd,lag(3) trend
dfuller avgtmin,lag(3) trend
dfuller avgsnow,lag(3) trend
dfuller avgsnwd,lag(3) trend
*Final solution
display 4*(6975/100)^(2/9)
newey crime_count avgtmax, lag(10)
newey crime_count avgawnd, lag(10)
newey crime_count avgprcp, lag(10)
newey crime_count avgtmin, lag(10)
newey crime_count avgsnow, lag(10)
newey crime_count avgsnwd, lag(10)
newey crime_count avgawnd avgprcp avgtmin avgsnow avgsnwd edate holiday, lag(10)
gen change=1 if year>2004
replace change=0 if change!=1
gen edatesq=edate^2
asdoc newey crime_count avgawnd avgprcp avgsnow avgsnwd avgtmax edate holiday change edatesq, lag(10)
asdoc newey violent_count avgawnd avgprcp avgsnow avgsnwd avgtmax edate holiday change edatesq, lag(10)
asdoc newey trust_count avgawnd avgprcp avgsnow avgsnwd avgtmax edate holiday change edatesq, lag(10)
asdoc newey Theft_count avgawnd avgprcp avgsnow avgsnwd avgtmax edate holiday change edatesq, lag(10)
asdoc newey drug_count avgawnd avgprcp avgsnow avgsnwd avgtmax edate holiday change edatesq, lag(10)
asdoc newey sex_count avgawnd avgprcp avgsnow avgsnwd avgtmax edate holiday change edatesq, lag(10)
asdoc newey children_count avgawnd avgprcp avgsnow avgsnwd avgtmax edate holiday change edatesq, lag(10)
asdoc newey game_count avgawnd avgprcp avgsnow avgsnwd avgtmax edate holiday change edatesq, lag(10)
newey crime_count avgawnd avgprcp avgsnow avgsnwd holiday change edate edatesq, lag(10)
test edate=edatesq=0
graph bar (rawsum) crime_count (rawsum) violent_count (rawsum) trust_count (rawsum) Theft_count (rawsum) drug_count (rawsum) sex_count (rawsum) children_count (rawsum) game_count
graph pie crime_count violent_count trust_count Theft_count drug_count sex_count children_count game_count
generate total_crime=sum(crime_count)
generate total_violent=sum(violent_count)
generate total_trust=sum(trust_count)
generate total_Theft=sum(Theft_count)
generate total_drug=sum(drug_count)
generate total_sex=sum(sex_count)
generate total_children=sum(children_count)
generate total_game=sum(game_count)
summarize crime_count violent_count
asdoc sum crime_count violent_count trust_count Theft_count drug_count sex_count children_count game_count avgawnd avgprcp avgwesd avgtmax avgtmin avgsnow avgsnwd, detail