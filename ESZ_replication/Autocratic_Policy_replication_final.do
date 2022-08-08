*This is the link to the root folder containing source data
local path_data="C:\Users\Алексей\Dropbox\research\renovation_github\"

*This is the link to the working folder
local path="C:\Users\Алексей\Dropbox\research\renovation_soccap\"

use "`path_data'renovation_1400.dta", clear

set more off

local vlist="male age higher_ed income live_since emp_pens emp_budget apt_privatized rooms per_room wood reformazkh_manage_gbu land_private land_unmarked" 

gen live_since=2018- q8
replace live_since=. if q8==99
replace live_since=0 if live_since==-1
lab var live_since "Years lived"
gen live_since_10=live_since/10
lab var live_since_10 "Years lived \$\times\$ 10"
lab var higher_ed "Higher education"

g q19_r=4-q19
replace q19_r=. if q19>9
g q21_r=4-q21
replace q21_r=. if q21>9
gen q29_1r=3-q29_1
gen q29_2r=3-q29_2
gen q29_3r=3-q29_3
replace q29_1r=. if q29_1>9
replace q29_2r=. if q29_2>9
replace q29_3r=. if q29_3>9
forval i=1/62 {
gen dqto`i'=qto==`i'
}
lab var age Age
replace renov_vote_turnout= renov_vote_turnout/100
lab var renov_vote_turnout "Turnout"
lab var perc_for "Vote in favor"

lab var reformazkh_manage_gbu "State managed building"
lab var per_room "Residents per room"
lab var apt_privatized "Privatized apartment"
lab var land_private "Privatized land"
lab var land_unmarked "Unassigned land"

gen group_cat=.
replace group_cat=0 if voted==.
replace group_cat=1 if voted==0&renov_aug_2017==0
replace group_cat=2 if voted==0&renov_aug_2017==1
replace group_cat=3 if voted==1
label define group_cat 0 "Moscow sample" 1 "No vote" 2 "Vote, no May 2017 list" 3 "May 2017 list"
label values group_cat group_cat



local ii: word count of `vlist'
* ii is the number of variables in the list

local vlist_z=""
local ii=`ii'-1
forval i=1/`ii' {
	local ww: word `i' of `vlist'
	*We run through the list
	tabstat `ww' if qto_==0, save stats(mean sd)
	mat MM=r(StatTotal)
	*And obtain the matrix containing mean and sd of each variable. 
	gen `ww'_z=(`ww'-MM[1,1])/MM[2,1]
	*And generate z-scored variable
	local varlabel : var label `ww'
	lab var `ww'_z "`varlabel'"
	*And label that variable
	local vlist_z="`vlist_z' `ww'_z"
}






***********************************************************************************************************************
********************** BALANCE TEST OF BUILDING-LEVEL COVARIATES ******************************************************
***********************************************************************************************************************

bysort address_id: gen nn=_n

local fname="`path'balance_house_table.tex"
file open mf using "`fname'", write replace
file write mf "\def\sym#1{\ifmmode^{#1}\else\(^{#1}\)\fi}" _n
file write mf "\begin{tabular}{|p{7cm}|cc|cc|}" _n
file write mf "\hline" _n
file write mf "&May 2017 list: No&May 2017 list: Yes&stat&\$p\$\\" _n
file write mf "\hline" _n

tabstat qto if qto_==0&nn==1, by(voted) stats(count) save
mat v0=r(Stat1)
mat v1=r(Stat2)
local v00=string(v0[1,1],"%3.0f")
local v10=string(v1[1,1],"%3.0f")
file write mf "Buildings&`v00'&`v10'&& \\" _n

tabstat qto if qto_==0&nn==1&is_brick==1, by(voted) stats(count) save
mat v0=r(Stat1)
mat v1=r(Stat2)
local v00=string(v0[1,1],"%3.0f")
local v10=string(v1[1,1],"%3.0f")
file write mf "Including brick buildings&`v00'&`v10'&& \\" _n

tabstat qto if qto_==0, by(voted) stats(count) save
mat v0=r(Stat1)
mat v1=r(Stat2)
local v00=string(v0[1,1],"%3.0f")
local v10=string(v1[1,1],"%3.0f")
file write mf "\$N\$ people surveyed&`v00'&`v10'&& \\" _n

tabstat qto if qto_==0&is_brick==1, by(voted) stats(count) save
mat v0=r(Stat1)
mat v1=r(Stat2)
local v00=string(v0[1,1],"%3.0f")
local v10=string(v1[1,1],"%3.0f")
file write mf "\$N\$ people surveyed, in brick buildings&`v00'&`v10'&& \\" _n


ttest distance2 if qto_==0&nn==1, by(voted)
local v00=string(r(mu_1),"%3.1f")
local v10=string(r(mu_2),"%3.1f")
local p=string(r(p),"%9.4f")
file write mf "Distance to closest metro station&`v00'&`v10'&two-sided \$t\$&`p' \\" _n

cc voted reformazkh_manage_gbu if qto_==0, exact
local p=string(r(p_exact),"%9.4f")
tabstat reformazkh_manage_gbu if qto_==0, by(voted) save
mat v0=r(Stat1)
mat v1=r(Stat2)
local v00=string(v0[1,1],"%9.3f")
local v10=string(v1[1,1],"%9.3f")
file write mf "State-managed building&`v00'&`v10'&Fisher's exact&`p' \\" _n

cc voted land_private if qto_==0, exact
local p=string(r(p_exact),"%9.4f")
tabstat land_private if qto_==0, by(voted) save
mat v0=r(Stat1)
mat v1=r(Stat2)
local v00=string(v0[1,1],"%9.3f")
local v10=string(v1[1,1],"%9.3f")
file write mf "Privatized land&`v00'&`v10'&Fisher's exact&`p' \\" _n

cc voted land_unmarked if qto_==0, exact
local p=string(r(p_exact),"%9.4f")
tabstat land_unmarked if qto_==0, by(voted) save
mat v0=r(Stat1)
mat v1=r(Stat2)
local v00=string(v0[1,1],"%9.3f")
local v10=string(v1[1,1],"%9.3f")
file write mf "Unassigned land&`v00'&`v10'&Fisher's exact&`p' \\" _n

ttest year_final if qto_==0&nn==1, by(voted)
local v00=string(r(mu_1),"%9.1f")
local v10=string(r(mu_2),"%9.1f")
local n0=string(r(N_1),"%9.0f")
local n1=string(r(N_2),"%9.0f")
local p=string(r(p),"%9.4f")
file write mf "Year built&`v00'&`v10'&two-sided \$t\$&`p' \\" _n

ttest apt_final if qto_==0&nn==1, by(voted)
local v00=string(r(mu_1),"%9.1f")
local v10=string(r(mu_2),"%9.1f")
local n0=string(r(N_1),"%9.0f")
local n1=string(r(N_2),"%9.0f")
local p=string(r(p),"%9.4f")
file write mf "Number of apartments&`v00'&`v10'&two-sided \$t\$&`p' \\" _n

ttest reformazkh_iznos_total if qto_==0&nn==1, by(voted)
local v00=string(r(mu_1),"%9.1f")
local v10=string(r(mu_2),"%9.1f")
local n0=string(r(N_1),"%9.0f")
local n1=string(r(N_2),"%9.0f")

local p=string(r(p),"%9.4f")
file write mf "Overall condition (0-excellent, 100-poor)&`v00'&`v10'&two-sided \$t\$&`p' \\" _n


ttest n_cars_f if qto_==0&nn==1, by(voted)
local v00=string(r(mu_1),"%9.3f")
local v10=string(r(mu_2),"%9.3f")
local p=string(r(p),"%9.4f")
file write mf "Car owners&`v00'&`v10'&two-sided \$t\$&`p' \\" _n

ttest n_pensioners_f if qto_==0&nn==1, by(voted)
local v00=string(r(mu_1),"%9.3f")
local v10=string(r(mu_2),"%9.3f")
local p=string(r(p),"%9.4f")
file write mf "Retirees&`v00'&`v10'&two-sided \$t\$&`p' \\" _n

ttest n_children_f if qto_==0&nn==1, by(voted)
local v00=string(r(mu_1),"%9.3f")
local v10=string(r(mu_2),"%9.3f")
local p=string(r(p),"%9.4f")
file write mf "Children&`v00'&`v10'&two-sided \$t\$&`p' \\" _n

ttest n_work_healthcare_f if qto_==0&nn==1, by(voted)
local v00=string(r(mu_1),"%9.3f")
local v10=string(r(mu_2),"%9.3f")
local p=string(r(p),"%9.4f")
file write mf "Work in health care&`v00'&`v10'&two-sided \$t\$&`p' \\" _n

ttest n_work_education_f if qto_==0&nn==1, by(voted)
local v00=string(r(mu_1),"%9.3f")
local v10=string(r(mu_2),"%9.3f")
local p=string(r(p),"%9.4f")
file write mf "Work in education&`v00'&`v10'&two-sided \$t\$&`p' \\" _n

ttest n_work_culture_f if qto_==0&nn==1, by(voted)
local v00=string(r(mu_1),"%9.3f")
local v10=string(r(mu_2),"%9.3f")
local p=string(r(p),"%9.4f")
file write mf "Work in culture&`v00'&`v10'&two-sided \$t\$&`p' \\" _n

ttest n_work_communal_f if qto_==0&nn==1, by(voted)
local v00=string(r(mu_1),"%9.3f")
local v10=string(r(mu_2),"%9.3f")
local p=string(r(p),"%9.4f")
file write mf "Work in utilities&`v00'&`v10'&two-sided \$t\$&`p' \\" _n

ttest n_work_transport_f if qto_==0&nn==1, by(voted)
local v00=string(r(mu_1),"%9.3f")
local v10=string(r(mu_2),"%9.3f")
local p=string(r(p),"%9.4f")
file write mf "Work in transport&`v00'&`v10'&two-sided \$t\$&`p' \\" _n

ttest price_meter_av if qto_==0&nn==1, by(voted)
local v00=string(r(mu_1),"%9.3f")
local v10=string(r(mu_2),"%9.3f")
local p=string(r(p),"%9.4f")
file write mf "Price per m sq&`v00'&`v10'&two-sided \$t\$&`p' \\" _n


file write mf "\hline" _n
file write mf "\end{tabular}"
file close mf


**********************************************************************************************************************
********************** BALANCE TEST OF INDIVIDUAL-LEVEL COVARIATES ***************************************************
**********************************************************************************************************************


local fname="`path'balance_table.tex"
file open mf using "`fname'", write replace
file write mf "\def\sym#1{\ifmmode^{#1}\else\(^{#1}\)\fi}" _n
file write mf "\begin{tabular}{|p{5cm}|cc|cc|}" _n
file write mf "\hline" _n
file write mf "&May 2017 list: No&May 2017 list: Yes&stat&\$p\$\\" _n
file write mf "\hline" _n
cc voted male if qto_==0, exact
local p=string(r(p_exact),"%9.4f")
tabstat male if qto_==0, by(voted) save
mat v0=r(Stat1)
mat v1=r(Stat2)
local v00=string(v0[1,1],"%3.2f")
local v10=string(v1[1,1],"%3.2f")
file write mf "Male&`v00'&`v10'&Fisher's exact&`p' \\" _n
tab male voted if qto_==0, chi
local p=string(r(p),"%9.4f")
file write mf " &&&chi 2&`p' \\" _n

ttest age if qto_==0, by(voted)
local v00=string(r(mu_1),"%3.2f")
local v10=string(r(mu_2),"%3.2f")
local p=string(r(p),"%9.4f")
file write mf "Age&`v00'&`v10'&two-sided \$t\$&`p' \\" _n
ranksum age if qto_==0, by(voted)
local p=string(2 * normprob(-abs(r(z))),"%9.4f")
file write mf "&&&ranksum&`p' \\" _n

cc voted higher_ed if qto_==0, exact
local p=string(r(p_exact),"%9.4f")
tabstat higher_ed if qto_==0, by(voted) save
mat v0=r(Stat1)
mat v1=r(Stat2)
local v00=string(v0[1,1],"%3.2f")
local v10=string(v1[1,1],"%3.2f")
file write mf "Higher education&`v00'&`v10'&Fisher's exact&`p' \\" _n
tab higher_ed voted if qto_==0, chi
local p=string(r(p),"%9.4f")
file write mf " &&&chi 2&`p' \\" _n


ttest income if qto_==0, by(voted)
local v00=string(r(mu_1),"%3.2f")
local v10=string(r(mu_2),"%3.2f")
local p=string(r(p),"%9.4f")
file write mf "Income&`v00'&`v10'&two-sided \$t\$&`p' \\" _n
ranksum income if qto_==0, by(voted)
local p=string(2 * normprob(-abs(r(z))),"%9.4f")
file write mf "&&&ranksum&`p' \\" _n

ttest live_since if qto_==0, by(voted)
local v00=string(r(mu_1),"%3.2f")
local v10=string(r(mu_2),"%3.2f")
local p=string(r(p),"%9.4f")
file write mf "Years lived&`v00'&`v10'&two-sided \$t\$&`p' \\" _n
ranksum live_since if qto_==0, by(voted)
local p=string(2 * normprob(-abs(r(z))),"%9.4f")
file write mf "&&&ranksum&`p' \\" _n



cc voted emp_pens if qto_==0, exact
local p=string(r(p_exact),"%9.4f")
tabstat emp_pens if qto_==0, by(voted) save
mat v0=r(Stat1)
mat v1=r(Stat2)
local v00=string(v0[1,1],"%3.2f")
local v10=string(v1[1,1],"%3.2f")
file write mf "Retiree&`v00'&`v10'&Fisher's exact&`p' \\" _n
tab emp_pens voted if qto_==0, chi
local p=string(r(p),"%9.4f")
file write mf " &&&chi 2&`p' \\" _n



cc voted emp_budget if qto_==0, exact
local p=string(r(p_exact),"%9.4f")
tabstat emp_budget if qto_==0, by(voted) save
mat v0=r(Stat1)
mat v1=r(Stat2)
local v00=string(v0[1,1],"%3.2f")
local v10=string(v1[1,1],"%3.2f")
file write mf "State employee&`v00'&`v10'&Fisher's exact&`p' \\" _n
tab emp_budget voted if qto_==0, chi
local p=string(r(p),"%9.4f")
file write mf " &&&chi 2&`p' \\" _n



cc voted apt_privatized if qto_==0, exact
local p=string(r(p_exact),"%9.4f")
tabstat apt_privatized if qto_==0, by(voted) save
mat v0=r(Stat1)
mat v1=r(Stat2)
local v00=string(v0[1,1],"%3.2f")
local v10=string(v1[1,1],"%3.2f")
file write mf "Privatized apartment&`v00'&`v10'&Fisher's exact&`p' \\" _n
tab male voted if qto_==0, chi
local p=string(r(p),"%9.4f")
file write mf " &&&chi 2&`p' \\" _n


ttest rooms if qto_==0, by(voted)
local v00=string(r(mu_1),"%3.2f")
local v10=string(r(mu_2),"%3.2f")
local p=string(r(p),"%9.4f")
file write mf "Rooms&`v00'&`v10'&two-sided \$t\$&`p' \\" _n
ranksum rooms if qto_==0, by(voted)
local p=string(2 * normprob(-abs(r(z))),"%9.4f")
file write mf "&&&ranksum&`p' \\" _n

ttest per_room if qto_==0, by(voted)
local v00=string(r(mu_1),"%3.2f")
local v10=string(r(mu_2),"%3.2f")
local p=string(r(p),"%9.4f")
file write mf "Residents per room&`v00'&`v10'&two-sided \$t\$&`p' \\" _n
ranksum per_room if qto_==0, by(voted)
local p=string(2 * normprob(-abs(r(z))),"%9.4f")
file write mf "&&&ranksum&`p' \\" _n


cc voted wood if qto_==0, exact
local p=string(r(p_exact),"%9.4f")
tabstat wood if qto_==0, by(voted) save
mat v0=r(Stat1)
mat v1=r(Stat2)
local v00=string(v0[1,1],"%3.2f")
local v10=string(v1[1,1],"%3.2f")
file write mf "Wood frames&`v00'&`v10'&Fisher's exact&`p' \\" _n
tab wood voted if qto_==0, chi
local p=string(r(p),"%9.4f")
file write mf " &&&chi 2&`p' \\" _n


ttest hour_start if qto_==0, by(voted)
local v00=string(r(mu_1),"%3.2f")
local v10=string(r(mu_2),"%3.2f")
local p=string(r(p),"%9.4f")
file write mf "Hour of interview&`v00'&`v10'&two-sided \$t\$&`p' \\" _n
ksmirnov hour_start if qto_==0, by(voted)
local p=string(r(p),"%9.4f")
file write mf "&&&Kolmogorov-Smirnov&`p' \\" _n

file write mf "\hline" _n

file write mf "\end{tabular}"
file close mf


**********************************************************************
*********** COMPONENTS OF GENERIC PROSOCIAL NORMS INDEX **************
**********************************************************************

pca q19_r q20_3 q20_4 q20_5 q20_6 if qto_==0
predict soccap_generic
mat FL=e(L)
mat EV=e(Ev)
quietly tabstat soccap_generic if qto_==0, save stats(sd)
mat RR=r(StatTotal)
local ll=RR[1,1]
replace soccap_generic=soccap_generic/`ll'



.redist=.object.new
.redist.Declare array list
.redist.list[1]="Can rely on neighbors"
.redist.list[2]="Helped/was helped by with a personal problem"
.redist.list[3]="Watched over the neighbor's apartment / was watched by the neighbor"
.redist.list[4]="Helped with children"
.redist.list[5]="Lend food, medicine, etc"
.redist.list[6]="Generic social capital index"

local fname="`path'soccap_generic_pca.tex"
file open mf using "`fname'", write replace
file write mf "\def\sym#1{\ifmmode^{#1}\else\(^{#1}\)\fi}" _n

file write mf "\begin{tabular}{|p{8cm}|c|}" _n
file write mf "\hline\hline" _n
file write mf "&Factor loading\\" _n
file write mf "\hline" _n
forval ii=1/5 {
	local s1="`.redist.list[`ii']'"
	local m1=string(FL[`ii',1],"%9.3f")
	file write mf "`s1'&`m1'\\" _n	
}
local eig=string(EV[1,1],"%9.3f")
local prop=string(EV[1,1]/e(trace),"%9.3f")
local note="\tiny Eigenvector for the first principal component is `eig'; `prop' of variance is explained"
file write mf "\hline" _n
file write mf "\multicolumn{2}{p{10cm}}{`note'}" _n
file write mf "\end{tabular}"
file close mf

**********************************************************************
*********** GENERIC NORMS DEPENDING ON TREATMENT *********************
**********************************************************************

mat X3=J(6,2,.)


local vvvv=" q19_r q20_3 q20_4 q20_5 q20_6 soccap_generic"
*local dddd="reg logit logit logit logit reg "
forval i=1/6 {
	local vv: word `i' of `vvvv'
	local dd: word `i' of `dddd'
	quietly ttest `vv' if qto_==0, by(voted)
	mat X3[`i',1]=r(p)
	*quietly reg `vv' voted `vlist' i.qto if qto_==0
	*mat E=r(table)
	*mat X3[`i',2]=round(E[4,1],.0001)
}

tabstat `vvvv' if qto_==0, by(voted) save
mat X1=r(Stat1)
mat X2=r(Stat2)

local note="\tiny Columns 1 and 2 are the mean values in buildings off and on the May 2017 list. Column 3 is the \$ p \$ -value for the two-tailed \$ t \$-test comparing the means in Columns 1 and 2."

local fname="`path'soccap_generic_tab1.tex"
file open mf using "`fname'", write replace
file write mf "\def\sym#1{\ifmmode^{#1}\else\(^{#1}\)\fi}" _n
file write mf "\begin{tabular}{|p{4cm}|ccc|}" _n
file write mf "\hline" _n
file write mf "&No&Yes&\$t\$-test&OLS\\" _n
file write mf "\hline" _n
forval ii=1/6 {
	local s1="`.redist.list[`ii']'"
	local m1=string(X1[1,`ii'],"%9.3f")
	local m2=string(X2[1,`ii'],"%9.3f")
	global num=X3[`ii',1]
	do "`path'addstars1.do"
	local m3="$num"
	*global num=X3[`ii',2]
	*do "`path'addstars1.do"
	*local m4="$num"
	file write mf "`s1'&`m1'&`m2'&`m3'\\" _n	
}
file write mf "\hline" _n
file write mf "\multicolumn{4}{p{11cm}}{`note'}" _n
file write mf "\end{tabular}"
file close mf




**********************************************************************
*********** COMPONENTS OF GENERIC HOUSE IMPROVEMENT INDEX ************
**********************************************************************

pca q16_3 q16_4 q16_6 q16_9 if qto_==0
predict soccap_house
mat FL=e(L)
mat EV=e(Ev)
quietly tabstat soccap_house if qto_==0, save stats(sd)
mat RR=r(StatTotal)
local ll=RR[1,1]
replace soccap_house=soccap_house/`ll'


.redist=.object.new
.redist.Declare array list
.redist.list[1]="Took part in community improvements ({\it subbotnik})"
.redist.list[2]="Took part in renovation/cleaning up of stairway"
.redist.list[3]="Organized events with neighbors (cultural/ leisure/ charity etc)"
.redist.list[4]="Participated in community watch"
.redist.list[5]="House-specific improvements index"

local fname="`path'soccap_house_pca.tex"
file open mf using "`fname'", write replace
file write mf "\def\sym#1{\ifmmode^{#1}\else\(^{#1}\)\fi}" _n

file write mf "\begin{tabular}{|p{4cm}|c|}" _n
file write mf "\hline" _n
file write mf "&Factor loading\\" _n
file write mf "\hline" _n
forval ii=1/4 {
	local s1="`.redist.list[`ii']'"
	local m1=string(FL[`ii',1],"%9.3f")
	file write mf "`s1'&`m1'\\" _n	
}
local eig=string(EV[1,1],"%9.3f")
local prop=string(EV[1,1]/e(trace),"%9.3f")
local note="\tiny Eigenvector for the first principal component is `eig'; `prop' of variance is explained"
file write mf "\hline" _n
file write mf "\multicolumn{2}{p{10cm}}{`note'}" _n
file write mf "\end{tabular}"
file close mf


**********************************************************************
*********** HOUSE IMPROVEMENTS DEPENDING ON TREATMENT ********************
**********************************************************************

mat X3=J(5,2,.)

local vvvv="q16_3 q16_4 q16_6 q16_9 soccap_house"
*local dddd="logit logit logit logit reg"
forval i=1/5 {
	local vv: word `i' of `vvvv'
	local dd: word `i' of `dddd'
	ttest `vv' if qto_==0, by(voted)
	mat X3[`i',1]=r(p)
*	quietly reg `vv' voted `vlist' i.qto if qto_==0
*	mat E=r(table)
*	mat X3[`i',2]=round(E[4,1],.0001)
}

tabstat `vvvv' if qto_==0, by(voted) save
mat X1=r(Stat1)
mat X2=r(Stat2)

local note="\tiny Columns 1 and 2 are the mean values in buildings off and on the May 2017 list. Column 3 is the \$ p \$ -value for the two-tailed \$ t \$-test comparing the means in Columns 1 and 2."
local fname="`path'soccap_house_tab1.tex"
file open mf using "`fname'", write replace
file write mf "\def\sym#1{\ifmmode^{#1}\else\(^{#1}\)\fi}" _n
file write mf "\begin{tabular}{|p{4cm}|ccc|}" _n
file write mf "\hline\hline" _n
file write mf "&No&Yes&\$t\$-test\\" _n
file write mf "\hline" _n
forval ii=1/5 {
	local s1="`.redist.list[`ii']'"
	local m1=string(X1[1,`ii'],"%9.3f")
	local m2=string(X2[1,`ii'],"%9.3f")
	global num=X3[`ii',1]
	do "`path'addstars1.do"
	local m3="$num"
	*global num=X3[`ii',2]
	*do "`path'addstars1.do"
	*local m4="$num"
	file write mf "`s1'&`m1'&`m2'&`m3'\\" _n	
}
file write mf "\hline" _n
file write mf "\multicolumn{4}{p{11cm}}{`note'}" _n
file write mf "\end{tabular}"
file close mf


**********************************************************************
*********** COMPONENTS OF POLICY-SPECIFIC INTERACTIONS INDEX *********
**********************************************************************

pca q31B_1 q31B_2 q31B_3 q31B_4 q31B_5 q31B_6 q31B_7 q31B_8 if qto_==0
predict policy_specific
mat FL=e(L)
mat EV=e(Ev)
quietly tabstat policy_specific if qto_==0, save stats(sd)
mat RR=r(StatTotal)
local ll=RR[1,1]
replace policy_specific=policy_specific/`ll'
lab var policy_specific "Policy-specific interactions"

.redist=.object.new
.redist.Declare array list
.redist.list[1]="Signed a petition"
.redist.list[2]="Took part in a rally"
.redist.list[3]="Discussed in social networks"
.redist.list[4]="Voted in elections for appropriate candidate"
.redist.list[5]="Discussed with neighbors"
.redist.list[6]="Met an elected deputy"
.redist.list[7]="Participated in an initiative group"
.redist.list[8]="Did nothing"
.redist.list[9]="Policy-specific interactions index"



local fname="`path'policy_specific_pca.tex"
file open mf using "`fname'", write replace
file write mf "\def\sym#1{\ifmmode^{#1}\else\(^{#1}\)\fi}" _n

file write mf "\begin{tabular}{|p{8cm}|c|}" _n
file write mf "\hline" _n
file write mf "&Factor loading\\" _n
file write mf "\hline" _n
forval ii=1/8 {
	local s1="`.redist.list[`ii']'"
	local m1=string(FL[`ii',1],"%9.3f")
	file write mf "`s1'&`m1'\\" _n	
}
local eig=string(EV[1,1],"%9.3f")
local prop=string(EV[1,1]/e(trace),"%9.3f")
local note="\tiny Eigenvector for the first principal component is `eig'; `prop' of variance is explained"
file write mf "\hline" _n
file write mf "\multicolumn{2}{p{10cm}}{`note'}" _n
file write mf "\end{tabular}"
file close mf



**********************************************************************
*********** POLICY-SPECIFIC INTERACTIONS DEPENDING ON TREATMENT ******
**********************************************************************


mat X3=J(9,2,.)
local vvvv="q31B_1 q31B_2 q31B_3 q31B_4 q31B_5 q31B_6 q31B_7 q31B_8 policy_specific"
*local dddd="logit logit logit logit logit logit logit logit reg"
forval i=1/9 {
	local vv: word `i' of `vvvv'
	local dd: word `i' of `dddd'
	ttest `vv' if qto_==0, by(voted)
	mat X3[`i',1]=r(p)
*	quietly reg `vv' voted `vlist' i.qto if qto_==0
*	mat E=r(table)
*	mat X3[`i',2]=round(E[4,1],.0001)
}

tabstat `vvvv' if qto_==0, by(voted) save
mat X1=r(Stat1)
mat X2=r(Stat2)

local fname="`path'policy_specific_tab1.tex"
local note="\tiny Columns 1 and 2 are the mean values in buildings off and on the May 2017 list. Column 3 is the \$ p \$ -value for the two-tailed \$ t \$-test comparing the means in Columns 1 and 2."
file open mf using "`fname'", write replace
file write mf "\def\sym#1{\ifmmode^{#1}\else\(^{#1}\)\fi}" _n
file write mf "\begin{tabular}{|p{4cm}|ccc|}" _n
file write mf "\hline\hline" _n
file write mf "&No&Yes&\$t\$-test\\" _n
file write mf "\hline" _n
forval ii=1/9 {
	local s1="`.redist.list[`ii']'"
	local m1=string(X1[1,`ii'],"%9.3f")
	local m2=string(X2[1,`ii'],"%9.3f")
	global num=X3[`ii',1]
	do "`path'addstars1.do"
	local m3="$num"
*	global num=X3[`ii',2]
*	do "`path'addstars1.do"
*	local m4="$num"
	file write mf "`s1'&`m1'&`m2'&`m3'\\" _n	
}
file write mf "\hline" _n
file write mf "\multicolumn{4}{p{11cm}}{`note'}" _n
file write mf "\end{tabular}"
file close mf



*******************************************************************************************************
*********** THE EFFECT OF VOTING ON POLICY-SPECIFIC INTERACTIONS AND SOCIAL CAPITAL *******************
*******************************************************************************************************


local fname "`path'table_main.tex"
estimates clear
local note="\tiny OLS regressions. Building group fixed effects. SEs clustered at building level. In Column 1 the dependent variable is the index of policy-specific interactions. In Columns 2 and 3 the dependent variable is the index of generic social capital. In Columns 4 and 5 the dependent variable is the house improvement index."

reg policy_specific voted `vlist' dqto* if qto_==0, cluster(address_id)
eststo m1
estadd local fixed "YES" , replace
estadd local cont "YES" , replace

reg soccap_generic voted `vlist' dqto* if qto_==0, cluster(address_id)
eststo m2
estadd local fixed "YES" , replace
estadd local cont "YES" , replace

reg soccap_generic policy_specific voted `vlist' dqto* if qto_==0, cluster(address_id)
eststo m3
estadd local fixed "YES" , replace
estadd local cont "YES" , replace

reg soccap_house voted `vlist' dqto* if qto_==0, cluster(address_id)
eststo m4
estadd local fixed "YES" , replace
estadd local cont "YES" , replace

reg soccap_house policy_specific voted `vlist' dqto* if qto_==0, cluster(address_id)
eststo m5
estadd local fixed "YES" , replace
estadd local cont "YES" , replace

esttab m1 m2 m3 m4 m5 using "`fname'", label nomtitle nogap compress se star(* 0.10 ** 0.05 *** 0.01) replace nonum s(fixed N r2, label("Group FE" "N" "R2")) keep(voted policy_specific `vlist') order(voted policy_specific `vlist') fragment

local fname "`path'table_main_pres.tex"
lab var policy_specific "Policy"
esttab m1 m2 m3 m4 m5 using "`fname'", label mtitles("Policy" Generic Generic House House) nogap compress se star(* 0.10 ** 0.05 *** 0.01) replace nonum s(cont fixed N r2, label("Controls" "Group FE" "N" "R2")) keep(voted policy_specific) order(voted policy_specific)



*********************************************************************************************************************
*********** THE EFFECT OF VOTING ON POLICY-SPECIFIC INTERACTIONS AND PROSOCIAL NORMS: ACME AND SENSITIVITY **********
*********************************************************************************************************************

mat TT=J(12,2,.)
local controls=" dqto1 dqto2 dqto3 dqto6  dqto8 dqto10 dqto11 dqto12 dqto14 dqto15 dqto16 dqto17  dqto21 dqto22 dqto23 dqto24 dqto25 dqto26 dqto27 dqto28 dqto29   dqto32 dqto33 dqto34 dqto36 dqto37 dqto38 dqto39 dqto40 dqto41 dqto42 dqto43 dqto44  dqto47  dqto49 dqto50 dqto51 dqto52 dqto53 dqto54 dqto55 dqto56 dqto57 dqto58  dqto60 dqto61 dqto62"
medeff (regress policy_specific voted `vlist' `controls') (regress soccap_generic voted policy_specific `vlist' `controls') if qto_==0, mediate(policy_specific) treat(voted) seed(213) level(90)
mat TT[1,1]=r(delta0)
mat TT[2,1]=r(delta0lo)		
mat TT[3,1]=r(delta0hi)		
mat TT[4,1]=r(zeta0)
mat TT[5,1]=r(zeta0lo)
mat TT[6,1]=r(zeta0hi)
mat TT[7,1]=r(tau)
mat TT[8,1]=r(taulo)
mat TT[9,1]=r(tauhi)
medsens (regress policy_specific voted `vlist' `controls') (regress soccap_generic voted policy_specific `vlist' `controls') if qto_==0, mediate(policy_specific) treat(voted) eps(.01) level(95) sims(1000)
mat TT[10,1]=r(r2t_thresh)
mat TT[11,1]=r(r2s_thresh)
mat TT[12,1]=r(errcr)
*graph export "`path'soccap_house_sensitivity.png", as(png) replace

medeff (regress policy_specific voted `vlist' `controls') (regress soccap_house voted policy_specific `vlist' `controls') if qto_==0, mediate(policy_specific) treat(voted) seed(213) level(95)
mat TT[1,2]=r(delta0)
mat TT[2,2]=r(delta0lo)		
mat TT[3,2]=r(delta0hi)		
mat TT[4,2]=r(zeta0)
mat TT[5,2]=r(zeta0lo)
mat TT[6,2]=r(zeta0hi)
mat TT[7,2]=r(tau)
mat TT[8,2]=r(taulo)
mat TT[9,2]=r(tauhi)
medsens (regress policy_specific voted `vlist' `controls') (regress soccap_house voted policy_specific `vlist' `controls') if qto_==0, mediate(policy_specific) treat(voted) eps(.01) level(95) sims(1000)
mat TT[10,2]=r(r2t_thresh)
mat TT[11,2]=r(r2s_thresh)
mat TT[12,2]=r(errcr)
*graph export "`path'soccap_generic_sensitivity.png", as(png) replace

local fname="`path'table_acme_soc.tex"
file open mf using "`fname'", write replace
	file write mf "\def\sym#1{\ifmmode^{#1}\else\(^{#1}\)\fi}" _n
	file write mf "\begin{tabular}{|c|cc|}" _n
	file write mf "\hline" _n
	file write mf "&Generic&House-specific\\" _n
	file write mf "\hline" _n
	
	local nn=string(TT[1,1],"%9.3f")
	local nn2=string(TT[2,1],"%9.3f")
	local nn3=string(TT[3,1],"%9.3f")
	local nn1=string(TT[1,2],"%9.3f")
	local nn21=string(TT[2,2],"%9.3f")
	local nn31=string(TT[3,2],"%9.3f")
	file write mf "ACME&`nn' (`nn2' `nn3')&`nn1' (`nn21' `nn31')\\" _n
	local nn=string(TT[4,1],"%9.3f")
	local nn2=string(TT[5,1],"%9.3f")
	local nn3=string(TT[6,1],"%9.3f")
	local nn1=string(TT[4,2],"%9.3f")
	local nn21=string(TT[5,2],"%9.3f")
	local nn31=string(TT[6,2],"%9.3f")
	file write mf "Direct effect&`nn' (`nn2' `nn3')&`nn1' (`nn21' `nn31')\\" _n
	local nn=string(TT[7,1],"%9.3f")
	local nn2=string(TT[8,1],"%9.3f")
	local nn3=string(TT[9,1],"%9.3f")
	local nn1=string(TT[7,2],"%9.3f")
	local nn21=string(TT[8,2],"%9.3f")
	local nn31=string(TT[9,2],"%9.3f")
	file write mf "Total effect&`nn' (`nn2' `nn3')&`nn1' (`nn21' `nn31')\\" _n
	local nn=string(TT[12,1],"%9.3f")
	local nn1=string(TT[12,2],"%9.3f")
	file write mf "\$\rho\$ at which ACME=0&`nn' &`nn1' \\" _n
	file write mf "\hline" _n
	file write mf "\end{tabular}"
file close mf




*****************************************************************************
*****  POLICY INTERACTIONS AND RENOVATION VOTE ******************************
*****************************************************************************


local fname="`path'table_policy_treat.tex"
estimates clear
reg policy_specific perc_for `vlist' if qto_==0, cluster(address_id)
eststo m1
estadd local fixed "YES" , replace
estadd local cont "YES" , replace
reg policy_specific renov_vote_turnout `vlist' if qto_==0, cluster(address_id)
eststo m2
estadd local fixed "YES" , replace
estadd local cont "YES" , replace
reg policy_specific perc_for renov_vote_turnout `vlist' if qto_==0, cluster(address_id)
eststo m3
estadd local fixed "YES" , replace
estadd local cont "YES" , replace


esttab m1 m2 m3 using "`fname'", label nomtitle nonum nogap compress se star(* 0.10 ** 0.05 *** 0.01) replace s(N r2, label("N" "R2")) order(perc_for renov_vote_turnout) frag
local fname="`path'table_policy_treat_pres.tex"
lab var renov_vote_turnout Turnout
lab var perc_for "Vote for"
esttab m1 m2 m3 using "`fname'", label nomtitle nonum nogap compress se star(* 0.10 ** 0.05 *** 0.01) replace nonum s(cont fixed N r2, label("Controls" "Group FE" "N" "R2")) wide keep(perc_for renov_vote_turnout) order(perc_for renov_vote_turnout) 



***********************************************************************************************************
************************ THE EFFECT OF HOUSE SIZE OF PROSOCIAL NORM ACCUMULATION **************************
***********************************************************************************************************

gen voted_apt=voted*apt_final
lab var voted_apt "May 2017 \$\times\$ Apartments"


local fname "`path'table_main_apts.tex"
estimates clear
*local note="\tiny OLS regressions. In Column 1 the dependent variable is the index of pension reform interactions. In Columns 2 and 3 the dependent variable is the index of generic social capital. In Columns 4 and 5 the dependent variable is the house improvement index."



reg policy_specific voted voted_apt apt_final `vlist' dqto* if qto_==0, cluster(address_id)
eststo m1
estadd local fixed "YES" , replace
estadd local cont "YES" , replace

reg soccap_generic voted voted_apt apt_final `vlist' dqto* if qto_==0, cluster(address_id)
eststo m2
estadd local fixed "YES" , replace
estadd local cont "YES" , replace

reg soccap_house voted voted_apt apt_final `vlist' dqto* if qto_==0, cluster(address_id)
eststo m3
estadd local fixed "YES" , replace
estadd local cont "YES" , replace


local fname "`path'table_main_apts.tex"
esttab m1 m2 m3 using "`fname'", label nomtitles nogap compress se star(* 0.10 ** 0.05 *** 0.01) replace nonum s(fixed N r2, label("Group FE" "N" "R2")) keep(voted voted_apt apt_final `vlist') order(voted voted_apt) frag

local fname "`path'table_main_apts_pres.tex"
esttab m1 m2 m3 using "`fname'", label mtitles(Policy Generic House) nonum nogap compress se star(* 0.10 ** 0.05 *** 0.01) replace nonum s(cont fixed N r2, label("Controls" "Group FE" "N" "R2")) keep(voted voted_apt apt_final) order(voted voted_apt apt_final) 


gen apt_num1=apt_final
replace apt_num1=140 if apt_final>140&apt_final!=.
hist apt_num1 if qto_==0, freq xlabel(60 "60" 80 "80" 100 "100" 120 "120" 140 "140+") xtitle("")
graph export "`path'apt_number.png", as(png) replace


****************************************************************************************************
****************** FIGURE: THE EFFECT OF PROGRAM INCLUSION DEPENDING ON BUILDING SIZE **************
****************************************************************************************************


graph drop _all
quietly reg policy_specific i.voted##c.apt_final `vlist' dqto* if qto_==0, cluster(address_id)
quietly margins, dydx(voted) at(apt_final=(60 80 100 120))
marginsplot, xscale(range(55 125)) ytitle(Effect of May 2017 list) title("") name("Policy") yline(0)
quietly reg soccap_generic i.voted##c.apt_final `vlist' dqto* if qto_==0, cluster(address_id)
quietly margins, dydx(voted) at(apt_final=(60 80 100 120))
marginsplot, xscale(range(55 125)) ytitle(Effect of May 2017 list) title("") name("Generic")  yline(0)
quietly reg soccap_house i.voted##c.apt_final `vlist' dqto* if qto_==0, cluster(address_id)
quietly margins, dydx(voted) at(apt_final=(60 80 100 120))
marginsplot, xscale(range(55 125)) ytitle(Effect of May 2017 list) title("") name("House")  yline(0)
gr combine Policy Generic House, row(1) ycommon xsize(6) ysize(3) note("The figure reports marginal effects of the {it: May 2017} variable in Table 12, calculated for different building sizes, with 95% CIs")
graph export "`path'apt_diff.png", as(png) replace


**********************************************************************
*********** PENSION REFORMS INDEX ************************************
**********************************************************************


pca q33B_1 q33B_2 q33B_3 q33B_4 q33B_5 q33B_6 q33B_7 q33B_8 if qto_==0
predict pension_specific
lab var pension_specific "Pension reform interactions"
mat FL=e(L)
mat EV=e(Ev)
quietly tabstat pension_specific if qto_==0, save stats(sd)
mat RR=r(StatTotal)
local ll=RR[1,1]
replace pension_specific=pension_specific/`ll'



.redist=.object.new
.redist.Declare array list
.redist.list[1]="Signed a petition"
.redist.list[2]="Took part in a rally"
.redist.list[3]="Discussed in social networks"
.redist.list[4]="Voted in elections for appropriate candidate"
.redist.list[5]="Discussed with neighbors"
.redist.list[6]="Met an elected deputy"
.redist.list[7]="Participated in an initiative group"
.redist.list[8]="Did nothing"
.redist.list[9]="Policy-specific interactions index"



local fname="`path'policy_specific_pca.tex"
file open mf using "`fname'", write replace
file write mf "\def\sym#1{\ifmmode^{#1}\else\(^{#1}\)\fi}" _n

file write mf "\begin{tabular}{|p{8cm}|c|}" _n
file write mf "\hline" _n
file write mf "&Factor loading\\" _n
file write mf "\hline" _n
forval ii=1/8 {
	local s1="`.redist.list[`ii']'"
	local m1=string(FL[`ii',1],"%9.3f")
	file write mf "`s1'&`m1'\\" _n	
}
local eig=string(EV[1,1],"%9.3f")
local prop=string(EV[1,1]/e(trace),"%9.3f")
local note="\tiny Eigenvector for the first principal component is `eig'; `prop' of variance is explained"
file write mf "\hline" _n
file write mf "\multicolumn{2}{p{10cm}}{`note'}" _n
file write mf "\end{tabular}"
file close mf




mat X3=J(9,2,.)
local vvvv="q33B_1 q33B_2 q33B_3 q33B_4 q33B_5 q33B_6 q33B_7 q33B_8 pension_specific"
*local dddd="logit logit logit logit logit logit logit logit reg"
forval i=1/9 {
	local vv: word `i' of `vvvv'
	local dd: word `i' of `dddd'
	ttest `vv' if qto_==0, by(voted)
	mat X3[`i',1]=r(p)
	quietly reg `vv' voted `vlist' i.qto if qto_==0
	mat E=r(table)
	mat X3[`i',2]=round(E[4,1],.0001)
}

tabstat `vvvv' if qto_==0, by(voted) save
mat X1=r(Stat1)
mat X2=r(Stat2)

local fname="`path'pension_specific_tab1.tex"
local note="\tiny Columns 1 and 2 are the mean values in buildings off and on the May 2017 list. Column 3 is the \$ p \$ -value for the two-tailed \$ t \$-test comparing the means in Columns 1 and 2. Column 4 is the \$ p \$ -value for the coefficient for the May 2017 list in OLS regression"
file open mf using "`fname'", write replace
file write mf "\def\sym#1{\ifmmode^{#1}\else\(^{#1}\)\fi}" _n
file write mf "\begin{tabular}{|p{4cm}|cccc|}" _n
file write mf "\hline\hline" _n
file write mf "&No&Yes&\$t\$-test&OLS\\" _n
file write mf "\hline" _n
forval ii=1/9 {
	local s1="`.redist.list[`ii']'"
	local m1=string(X1[1,`ii'],"%9.3f")
	local m2=string(X2[1,`ii'],"%9.3f")
	global num=X3[`ii',1]
	do "`path'addstars1.do"
	local m3="$num"
	global num=X3[`ii',2]
	do "`path'addstars1.do"
	
	local m4="$num"
	file write mf "`s1'&`m1'&`m2'&`m3'&`m4'\\" _n	
}
file write mf "\hline" _n
file write mf "\multicolumn{5}{p{11cm}}{`note'}" _n
file write mf "\end{tabular}"
file close mf



*******************************************************************************************************
*********** INTERACTIONS RELATED TO PENSION REFORM AND RENOVATION VOTE ********************************
*******************************************************************************************************


local fname "`path'table_pension.tex"
lab var voted_apt "May 2017 \$\times\$ Apartments"

estimates clear
local note="\tiny OLS regressions. Building group fixed effects. SEs clustered at building level. In Column 1 the dependent variable is the index of policy-specific interactions. In Columns 2 and 3 the dependent variable is the index of generic social capital. In Columns 4 and 5 the dependent variable is the house improvement index."

reg pension_specific voted `vlist' dqto* if qto_==0, cluster(address_id)
eststo m1
estadd local fixed "YES" , replace
estadd local cont "YES" , replace

reg pension_specific voted voted_apt apt_final `vlist' dqto* if qto_==0, cluster(address_id)
eststo m3
estadd local fixed "YES" , replace
estadd local cont "YES" , replace

esttab m1 m3 using "`fname'", label nomtitle nogap compress se star(* 0.10 ** 0.05 *** 0.01) replace nonum s(fixed N r2, label("Group FE" "N" "R2")) keep(voted voted_apt apt_final `vlist') order(voted voted_apt apt_final `vlist')  fragment

local fname "`path'table_pension_pres.tex"
esttab m1 m3 using "`fname'", label nomtitle nonum nogap compress se star(* 0.10 ** 0.05 *** 0.01) replace nonum s(cont fixed N r2, label("Controls" "Group FE" "N" "R2")) keep(voted voted_apt apt_final) order(voted voted_apt apt_final) 


************************************************************************************************************************************************
****************** FIGURE: THE EFFECT OF PROGRAM INCLUSION ON SOCIAL INTERACTIONS RELATED TO PENSIONS REFORM DEPENDING ON BUILDING SIZE ********
************************************************************************************************************************************************


quietly reg pension_specific i.voted##c.apt_final `vlist' dqto* if qto_==0, cluster(address_id)
quietly margins, dydx(voted) at(apt_final=(60 80 100 120))
marginsplot, xscale(range(55 125)) ytitle(Effect of May 2017 list) title("") yline(0) note("The figure reports marginal effects of the {it: May 2017} variable in Table 13, calculated for different building sizes, with 95% CIs")
graph export "`path'apt_diff_pens.png", as(png) replace

*******************************************************************************************************
*********** VOTE IN 2018 MAYORAL ELECTIONS AND RENOVATION VOTE ****************************************
*******************************************************************************************************


local fname "`path'table_main_2018.tex"
estimates clear
local note="\tiny OLS regressions. Building group fixed effects. SEs clustered at building level. In Column 1 the dependent variable is the index of policy-specific interactions. In Columns 2-4 the dependent variable is whether the individual reported voring in 2018 Mayoral election."
gen voted_2018=1-voted_abs

reg voted_2018 voted `vlist' dqto* if qto_==0, cluster(address_id)
eststo m1
estadd local fixed "YES" , replace
estadd local cont "YES" , replace

reg voted_2018 policy_specific voted `vlist' dqto* if qto_==0, cluster(address_id)
eststo m2
estadd local fixed "YES" , replace
estadd local cont "YES" , replace

reg voted_2018 voted voted_apt apt_final `vlist' dqto* if qto_==0, cluster(address_id)
eststo m3
estadd local fixed "YES" , replace
estadd local cont "YES" , replace

esttab m1 m2 m3 using "`fname'", label nomtitle nogap compress se star(* 0.10 ** 0.05 *** 0.01) replace nonum s(fixed N r2, label("Group FE" "N" "R2")) keep(voted policy_specific voted_apt apt_final `vlist') order(voted policy_specific voted_apt apt_final `vlist') fragment

local fname "`path'table_main_2018_pres.tex"
esttab m1 m2 m3 using "`fname'", label mtitles("2018" "2018" "2018") nonum nogap compress se star(* 0.10 ** 0.05 *** 0.01) replace nonum s(cont fixed N r2, label("Controls" "Group FE" "N" "R2")) keep(voted policy_specific voted_apt apt_final) order(voted policy_specific voted_apt apt_final) 



local controls=" dqto1 dqto2 dqto3  dqto6  dqto8  dqto10 dqto11 dqto12 dqto14 dqto15 dqto16 dqto17  dqto21 dqto22 dqto23 dqto24 dqto25 dqto26 dqto27 dqto28 dqto29   dqto32 dqto33 dqto34 dqto36 dqto37 dqto38 dqto39 dqto40 dqto41 dqto42 dqto43 dqto44  dqto47  dqto49 dqto50 dqto51 dqto52 dqto53 dqto54 dqto55 dqto56 dqto57 dqto58  dqto60 dqto61 dqto62"

medeff (regress policy_specific voted `vlist' `controls') (regress voted_2018 voted policy_specific `vlist' `controls') if qto_==0, mediate(policy_specific) treat(voted) seed(213) level(95)
*medsens (regress policy_specific voted `vlist' `controls') (regress voted_2018 voted policy_specific `vlist' `controls') if qto_==0, mediate(policy_specific) treat(voted) eps(.01) level(95) sims(1000)




*******************************************************************************************************************
*********** THE EFFECT OF VOTING ON POLICY-SPECIFIC INTERACTIONS AND 2018 VOTE: ACME AND SENSITIVITY **************
*******************************************************************************************************************

mat TT=J(12,2,.)
local controls=" dqto1 dqto2 dqto3  dqto6  dqto8  dqto10 dqto11 dqto12 dqto14 dqto15 dqto16 dqto17  dqto21 dqto22 dqto23 dqto24 dqto25 dqto26 dqto27 dqto28 dqto29   dqto32 dqto33 dqto34 dqto36 dqto37 dqto38 dqto39 dqto40 dqto41 dqto42 dqto43 dqto44  dqto47  dqto49 dqto50 dqto51 dqto52 dqto53 dqto54 dqto55 dqto56 dqto57 dqto58  dqto60 dqto61 dqto62"
medeff (regress policy_specific voted `vlist' `controls') (regress voted_2018 voted policy_specific `vlist' `controls') if qto_==0, mediate(policy_specific) treat(voted) seed(213) level(90)
mat TT[1,1]=r(delta0)
mat TT[2,1]=r(delta0lo)		
mat TT[3,1]=r(delta0hi)		
mat TT[4,1]=r(zeta0)
mat TT[5,1]=r(zeta0lo)
mat TT[6,1]=r(zeta0hi)
mat TT[7,1]=r(tau)
mat TT[8,1]=r(taulo)
mat TT[9,1]=r(tauhi)
medsens (regress policy_specific voted `vlist' `controls') (regress voted_2018 voted policy_specific `vlist' `controls') if qto_==0, mediate(policy_specific) treat(voted) eps(.01) level(95) sims(1000)
mat TT[10,1]=r(r2t_thresh)
mat TT[11,1]=r(r2s_thresh)
mat TT[12,1]=r(errcr)
*graph export "`path'soccap_house_sensitivity.png", as(png) replace


local fname="`path'table_acme_vote.tex"
file open mf using "`fname'", write replace
	file write mf "\def\sym#1{\ifmmode^{#1}\else\(^{#1}\)\fi}" _n
	file write mf "\begin{tabular}{|c|cc|}" _n
	file write mf "\hline" _n
	file write mf "&Vote 2018\\" _n
	file write mf "\hline" _n
	
	local nn=string(TT[1,1],"%9.3f")
	local nn2=string(TT[2,1],"%9.3f")
	local nn3=string(TT[3,1],"%9.3f")
	file write mf "ACME&`nn' (`nn2' `nn3')\\" _n
	local nn=string(TT[4,1],"%9.3f")
	local nn2=string(TT[5,1],"%9.3f")
	local nn3=string(TT[6,1],"%9.3f")
	file write mf "Direct effect&`nn' (`nn2' `nn3')\\" _n
	local nn=string(TT[7,1],"%9.3f")
	local nn2=string(TT[8,1],"%9.3f")
	local nn3=string(TT[9,1],"%9.3f")
	file write mf "Total effect&`nn' (`nn2' `nn3')\\" _n
	local nn=string(TT[12,1],"%9.3f")
	file write mf "\$\rho\$ at which ACME=0&`nn'\\" _n
	file write mf "\hline" _n
	file write mf "\end{tabular}"
file close mf

