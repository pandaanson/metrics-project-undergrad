clear all
import delimited "C:\Users\Anson\Downloads\Crimes_-_2001_to_present.csv"
drop id casenumber block iucr description locationdescription arrest domestic beat ward communityarea fbicode xcoordinate ycoordinate updatedon latitude longitude location
save "C:\Users\Anson\Documents\475 reference\crime data.dta",replace
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
 save "C:\Users\Anson\Documents\475 reference\crime data.dta",replace
 gen edate = mdy(month, day, year)
 drop if edate<mdy(5,22,2015)
 *20230
 drop if edate>mdy(9,30,2019)
 *21822
 sort edate
 gen dayindex=_n+mdy(5,22,2015)-1
 gen crime=1
 generate c_weather_sta=1 if district==3
 replace c_weather_sta=3 if district>=16 & district<=21
 replace c_weather_sta=2 if c_weather_sta==.
egen crime_count=total(crime), by(edate c_weather_sta)
drop month

sort edate c_weather_sta
quietly by edate c_weather_sta:  gen dup = cond(_N==1,0,_n)
drop if dup>1
 drop primarytype dayindex crime
drop dup

save "C:\Users\Anson\Documents\475 reference\base dataset.dta",replace
clear all
import delimited "C:\Users\Anson\Downloads\Beach_Weather_Stations_-_Automated_Sensors.csv"
drop batterylife measurementtimestamplabel measurementid
 gen StationCode=1 if stationname=="63rd Street Weather Station"
replace StationCode=2 if stationname=="Oak Street Weather Station"
 replace StationCode=3 if stationname=="Foster Weather Station"
drop stationname
split measurementtimestamp , p(/)
gen year=substr( measurementtimestamp3 ,1,4)
rename measuremen~1 month
rename measuremen~2 day
drop measurementtimestamp
destring day,replace
destring month,replace
destring year,replace
save "C:\Users\Anson\Documents\475 reference\weather data.dta",replace
gen edate = mdy(month, day, year)
drop day measurementtimestamp3 year month
sort edate StationCode
quietly by edate StationCode :  gen dup = cond(_N==1,0,_n)


*humidity
gen measure=1 if humidity>0
 replace measure=0 if humidity==.
sort edate StationCode
egen avghumdaily=sum(humidity) if measure==1, by(edate StationCode)
egen dforhum=sum(measure) if measure==1, by(edate StationCode)
gen avghumiditydaily=avghumdaily/dforhum if measure==1
drop humidity measure avghumdaily dforhum
*airtemperature
gen measure=1 if airtemperature>0
 replace measure=0 if airtemperature==.
egen avgdaily=sum(airtemperature) if measure==1, by(edate StationCode)
egen dforairtemp=sum(measure) if measure==1, by(edate StationCode)
gen avgairtempdaily=avgdaily/dforairtemp if measure==1
 drop airtemperature avgdaily measure dforairtemp
 *wetbulb
 gen measure=1 if wetbulbtemperature>0
 replace measure=0 if wetbulbtemperature==.
egen avgdaily=sum(wetbulbtemperature) if measure==1, by(edate StationCode)
egen dn=sum(measure) if measure==1, by(edate StationCode)
gen avgwetbulbtemperaturedaily=avgdaily/dn if measure==1
drop wetbulbtemperature dn avgdaily measure
*heading
 gen measure=1 if heading !=.
 replace measure=0 if heading==.
egen avgdaily=sum(heading) if measure==1, by(edate StationCode)
egen dn=sum(measure) if measure==1, by(edate StationCode)
gen avgheadingdaily=avgdaily/dn if measure==1
drop heading dn avgdaily measure
*barometricpressure
 gen measure=1 if barometricpressure !=.
 replace measure=0 if barometricpressure==.
egen avgdaily=sum(barometricpressure) if measure==1, by(edate StationCode)
egen dn=sum(measure) if measure==1, by(edate StationCode)
gen avgbarometricpressuredaily=avgdaily/dn if measure==1
drop barometricpressure dn avgdaily measure
*winddirection
 gen measure=1 if winddirection !=.
 replace measure=0 if winddirection==.
egen avgdaily=sum(winddirection) if measure==1, by(edate StationCode)
egen dn=sum(measure) if measure==1, by(edate StationCode)
gen avgwinddirectiondaily=avgdaily/dn if measure==1
drop winddirection dn avgdaily measure
*windspeed
 gen measure=1 if windspeed !=.
 replace measure=0 if windspeed==.
egen avgdaily=sum(windspeed) if measure==1, by(edate StationCode)
egen dn=sum(measure) if measure==1, by(edate StationCode)
gen avgwindspeeddaily=avgdaily/dn if measure==1
drop windspeed dn avgdaily measure
*solarradiation
 gen measure=1 if solarradiation !=.
 replace measure=0 if solarradiation==.
egen avgdaily=sum(solarradiation) if measure==1, by(edate StationCode)
egen dn=sum(measure) if measure==1, by(edate StationCode)
gen avgsolarradiationdaily=avgdaily/dn if measure==1
drop solarradiation dn avgdaily measure
*maximumwindspeed
 gen measure=1 if maximumwindspeed !=.
 replace measure=0 if maximumwindspeed==.
egen avgdaily=sum(maximumwindspeed) if measure==1, by(edate StationCode)
egen dn=sum(measure) if measure==1, by(edate StationCode)
gen avgmaximumwindspeeddaily=avgdaily/dn if measure==1
drop maximumwindspeed dn avgdaily measure
*avgrainperhour
 gen measure=1 if rainintensity !=.
 replace measure=0 if rainintensity==.
egen avgdaily=sum(rainintensity) if measure==1, by(edate StationCode)
egen dn=sum(measure) if measure==1, by(edate StationCode)
gen avgrainperhour=avgdaily/dn if measure==1
drop rainintensity dn avgdaily measure

drop intervalrain

*Total rain since last night
egen totalrainperday=max(totalrain), by(edate StationCode)
drop totalrain
*What happen on that day
*0 = No precipitation 60 = Liquid precipitation, e.g. rain - Ice, hail and sleet are transmitted as rain (60). 70 = Solid precipitation, e.g. snow 40 = unspecified precipitation
generate rain=1 if precipitationtype==60
generate snow=1 if precipitationtype==70
generate other=1 if precipitationtype==40
egen hoursofrain=sum(rain) , by(edate StationCode)
egen hoursofsnow=sum(snow) , by(edate StationCode)
egen hoursofother=sum(other) , by(edate StationCode)
generate rainOnThatDay=1 if hoursofrain>0
generate snowOnThatDay=1 if hoursofsnow>0
generate otherOnThatDay=1 if hoursofother>0
drop precipitationtype rain snow other
replace rainOnThatDay=1 if rainOnThatDay==.
replace snowOnThatDay=1 if snowOnThatDay==.
replace otherOnThatDay=1 if otherOnThatDay==.

*clean up
 generate emptyslot=1 if avghumiditydaily==. | avgairtempdaily ==. | avgwetbulbtemperaturedaily ==. | avgheadingdaily ==. | avgbarometricpressuredaily ==. |  avgwinddirectiondaily ==. | avgwindspeeddaily ==. |  avgsolarradiationdaily ==. |  avgmaximumwindspeeddaily ==. |  avgrainperhour ==. |  totalrainperday ==.
drop if dup>1
*merge
cd "C:\Users\Anson\Documents\475 reference\"
rename StationCode c_weather_sta
 merge 1:1 edate c_weather_sta using "base dataset"
save "C:\Users\Anson\Documents\475 reference\base dataset.dta",replace
generate policeboard=428955 if year==2015
replace policeboard=396841 if year==2016
replace policeboard=473644 if year==2017
replace policeboard=473519 if year==2018
replace policeboard=465978 if year==2019
generate policereview=8452010 if year==2015
replace policereview=8460483 if year==2016
replace policereview=2896323 if year==2017
replace policereview=13289393 if year==2018
replace policereview=13851285 if year==2019
generate police=1374214220 if year==2015
replace police=1384510306 if year==2016
replace police=1434741100 if year==2017
replace police=1511933076 if year==2018
replace police=1547167697 if year==2019
generate emergency=1374214220 if year==2015
replace emergency=1384510306 if year==2016
replace emergency=1434741100 if year==2017
replace emergency=1511933076 if year==2018
replace emergency=1547167697 if year==2019
clear all
*more humidity
import delimited "C:\Users\Anson\Documents\475 reference\humidity.csv"
drop vancouver portland sanfrancisco seattle losangeles sandiego lasvegas phoenix albuquerque denver sanantonio dallas houston kansascity minneapolis saintlouis nashville indianapolis atlanta detroit jacksonville charlotte miami pittsburgh toronto philadelphia newyork montreal boston beersheba telavivdistrict eilat haifa nahariyya jerusalem
rename chicago humidity
save "C:\Users\Anson\Documents\475 reference\Old humidity.dta",replace
clear all
*more pressure
import delimited "C:\Users\Anson\Documents\475 reference\pressure.csv"
drop vancouver portland sanfrancisco seattle losangeles sandiego lasvegas phoenix albuquerque denver sanantonio dallas houston kansascity minneapolis saintlouis nashville indianapolis atlanta detroit jacksonville charlotte miami pittsburgh toronto philadelphia newyork montreal boston beersheba telavivdistrict eilat haifa nahariyya jerusalem
rename chicago pressure
save "C:\Users\Anson\Documents\475 reference\Old pressure.dta",replace
clear all
*more temperature
import delimited "C:\Users\Anson\Documents\475 reference\temperature.csv"
drop vancouver portland sanfrancisco seattle losangeles sandiego lasvegas phoenix albuquerque denver sanantonio dallas houston kansascity minneapolis saintlouis nashville indianapolis atlanta detroit jacksonville charlotte miami pittsburgh toronto philadelphia newyork montreal boston beersheba telavivdistrict eilat haifa nahariyya jerusalem
rename chicago temperature
save "C:\Users\Anson\Documents\475 reference\Old temperature.dta",replace
clear all
*winddirection
import delimited "C:\Users\Anson\Documents\475 reference\wind_direction.csv"
drop vancouver portland sanfrancisco seattle losangeles sandiego lasvegas phoenix albuquerque denver sanantonio dallas houston kansascity minneapolis saintlouis nashville indianapolis atlanta detroit jacksonville charlotte miami pittsburgh toronto philadelphia newyork montreal boston beersheba telavivdistrict eilat haifa nahariyya jerusalem
rename chicago wind_direction
save "C:\Users\Anson\Documents\475 reference\Old wind_direction.dta",replace
clear all
*windspeed
import delimited "C:\Users\Anson\Documents\475 reference\wind_speed.csv"
drop vancouver portland sanfrancisco seattle losangeles sandiego lasvegas phoenix albuquerque denver sanantonio dallas houston kansascity minneapolis saintlouis nashville indianapolis atlanta detroit jacksonville charlotte miami pittsburgh toronto philadelphia newyork montreal boston beersheba telavivdistrict eilat haifa nahariyya jerusalem
rename chicago wind_speed
save "C:\Users\Anson\Documents\475 reference\Old wind_speed.dta",replace
clear all
*weather discription
import delimited "C:\Users\Anson\Documents\475 reference\weather_description.csv"
drop v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 v16 v17 v19 v20 v21 v22 v23 v24 v25 v26 v27 v28 v29 v30 v32 v31 v34 v36 v37 v35
drop v33
gen v=_n
drop if v<=2
drop v
rename v1 datetime
rename v18 weather_desciption


save "C:\Users\Anson\Documents\475 reference\Old weather_disciption.dta",replace
*merge old data
merge 1:1 datetime using "Old humidity"
drop if _merge==2 |merge==1
drop _merge
merge 1:1 datetime using "Old pressure"
drop if _merge==2 | _merge==1
drop _merge
merge 1:1 datetime using "Old temperature"
drop if _merge==2 | _merge==1
drop _merge
merge 1:1 datetime using "Old wind_direction"
drop if _merge==2 | _merge==1
drop _merge
merge 1:1 datetime using "Old wind_speed"
drop if _merge==2 | _merge==1
drop _merge


clear all
import delimited "C:\Users\Anson\Downloads\2057280.csv"
split date
drop awnd_attributes dapr_attributes fmtm_attributes mdpr_attributes pgtm_attributes prcp_attributes snow_attributes snwd_attributes tavg_attributes tmax_attributes tmin_attributes tobs_attributes tsun_attributes wdf2_attributes wdf5_attributes wesd_attributes wesf_attributes wsf2_attributes wsf5_attributes wt01_attributes wt02_attributes wt03_attributes wt04_attributes wt05_attributes wt06_attributes wt07_attributes wt08_attributes wt09_attributes wt10_attributes wt11_attributes wt13_attributes wt14_attributes wt15_attributes wt16_attributes wt17_attributes wt18_attributes wt19_attributes wt21_attributes wt22_attributes wv03_attributes wv20_attributes
split date,p("-")
rename date1 year
rename date2