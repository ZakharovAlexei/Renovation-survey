*  Compiles the workfile from sources and generates variables

clear
*local path="C:\Users\avzakharov\Dropbox\research\renovation_folder\"
*local path="C:\Users\ProfCy\Dropbox\renovation_folder\"
local path="C:\Users\0\Dropbox\research\renovation_github\"
use "`path'raw_data\renovation_1400_source.dta", clear

do "`path'relabel.do"

rename qTO qto
lab var qto "Building group id"

rename АДРЕС address_id
lab var address_id "Address ID"

replace address_id=address_id+1000 if month<4
gen qto_do_not_use=inlist(address_id,3,18,19,21,34,36,38,53,54,55,57,87,89,100,117,127,133,135,166,167,1007)
lab var qto_ "Do not use this observation"
lab var qto "Building group id"


replace qto=31 if address_id==1007
replace qto=40 if address_id==1001
replace qto=58 if address_id==1002
replace qto=14 if address_id==1003
replace qto=6 if address_id==1004
replace qto=1 if address_id==1005
replace qto=43 if address_id==1006
** CHECK WITH GONCHAROV ON address_id==1007 - ОК
replace qto=20 if address_id==1008

replace RAION=13 if address_id==1007
replace RAION=1 if address_id==1005
replace RAION=23 if address_id==1006
replace RAION=2 if address_id==1004
replace RAION=32 if address_id==1002
replace RAION=21 if address_id==1001
replace RAION=6 if address_id==1003


lab var ПОДЪЕЗД "Number of stairway"
rename ПОДЪЕЗД stairway

rename ВЫБОРКА sample
lab var sample "Type of sample"
lab define sample 2 "Main" 3 "Additional"
lab val sample sample

rename ОКРУГ okrug
lab var okrug "Administrative okrug"

merge m:1 address_id using "`path'\raw_data\unom.dta"
drop _merge

save "`path'renovation_1400.dta", replace


use "`path'sample\moscowbuildings2.dta", clear
keep unom reformazkh_manage_gbu reformazkh_iznos_total reformazkh_iznos_wall reformazkh_iznos_pere reformazkh_iznos_basement e_m2013_turnout e_m2013_f_sobianin e_m2013_f_navalny e_m2013_turnout_r e_m2013_f_navalny_r e_m2013_f_sobianin_r e_p2012_turnout e_p2012_f_home e_p2012_f_invalid e_p2012_f_putin e_p2012_f_prohorov e_p2012_f_zuganov e_p2012_f_zhirinovski e_p2012_f_mironov n_cars_f n_pensioners_f n_work_healthcare_f n_work_education_f n_children_f n_work_culture_f n_work_communal_f n_work_transport_f year_final area_per_apt_final indiv_final floors_final reformazkh_serie_all series_check renov_part perc_for perc_against renov_vote_turnout uik_number private municipal unmarked renov_aug_2017 renov_upd_2018 demolition_2018 apt_final distance2
drop if unom==.
save "`path'build1_temp.dta", replace


use "`path'renovation_1400.dta", clear
merge m:1 unom using "`path'build1_temp.dta"

drop if _merge==2
drop _merge
replace reformazkh_manage_gbu=0 if inlist(address_id,108,132,135)
replace apt_final=54 if address_id==1005
replace perc_for=.8 if address_id==25
replace perc_for=.32 if address_id==64
replace perc_for=.22 if address_id==66
replace perc_for=.45 if address_id==68
replace perc_for=.35 if address_id==71
replace renov_vote_turnout=.77 if address_id==71
replace perc_for=.88 if address_id==112
replace renov_vote_turnout=88.119 if address_id==112


label define address_id 1 "Millionnaya St., 10" 2 "Millionnaya St., 8 b. 3" 3 "Millionnaya St. 10A" 4 "1st Myasnikovskaya St., 14" 5 "1st Myasnikovskaya St., 14A" 6 "Pogonnyy Proyezd, 8" 7 "Pogonnyy Proyezd, 6" 8 "Boytsovaya St., 18 b. 2" 9 "Bul'var Marshala Rokossovskogo, 20/18" 10 "Ivanteyevskaya St., 20" 11 "Bul'var Marshala Rokossovskogo, 28/14" 12 "4st Grazhdanskaya St., 34 b. 3" 13 "Alymov Pereulok, 17" 14 "Igral'naya St., 4" 15 "Glebovskaya St., 4" 16 "Igral'naya St., 6 b. 2" 17 "15st Parkovaya St., 29 b. 1" 18 "16st Parkovaya St., 21 b.2" 19 "Chusovskaya St., 4 b.2" 20 "Chusovskaya St., 4 b.1" 21 "Chusovskaya St., 10 b.2" 22 "Nikitinskaya St., 1 b.1" 23 "Nikitinskaya St., 1 b.3" 24 "Nikitinskaya St., 1 b.2" 25 "3st Parkovaya St., 39 b.3" 26 "3st Parkovaya St., 36 b.3"27 "Novogireyevskaya St., 49/28" 28 "Martenovskaya St., 22 b.1" 29 "Martenovskaya St., 20" 30 "2st Vladimirskaya St., 59/39" 31 "Perovskaya St., 55" 32 "2st Vladimirskaya St., 34" 33 "1st Vladimirskaya St., 35 b.1" 34 "2st Vladimirskaya St., 9A" 35 "2st Vladimirskaya St., 9" 36 "2st Vladimirskaya St., 9Д" 37 "Zelenyy prospekt, 49" 38 "Metallurgov St., 46 b.3" 39 "Yartsevskaya St., 11 b.3" 40 "Bobruyskaya St., 18 b.3" 41 "Partizanskaya St., 49 b.2" 42 "Bobruyskaya St., 20" 43 "Bobruyskaya St., 18 b.1" 44 "Bobruyskaya St., 24" 45 "Bobruyskaya St., 26 b.1" 46 "Ekateriny Budanovoy St., 1/12" 47 "Molodogvardeyskaya St., 18 b.2" 48 "Molodogvardeyskaya St., 22 b.3" 49 "Bobruyskaya St., 18 b.2" 50 "Bobruyskaya St., 18 b.1" 51 "Bobruyskaya St., 26 b.2" 52 "Bobruyskaya St., 26 b.1" 53 "Krasnykh Zor' St., 29" 54 "Krasnykh Zor' St., 35" 55 "Krasnykh Zor' St., 31" 56 "Mozhaiskoe hwy, 20 b.2" 57 "Gvardeyskaya St., 11" 58 "Gvardeyskaya St., 13" 59 "Vatutina St., 5 b.2" 60 "Vatutina St., 4 b.1" 61 "Artamonova St., 8 b.2" 62 "Artamonova St., 8 b.1" 63 "Amin'yevskoye hwy, 32" 64 "Shcherbinka, Simferopol'skaya St., 4Б" 65 "Shcherbinka, Yubileynaya St., 10" 66 "Shcherbinka, Vysotnaya St., 3" 67 "Shcherbinka, Yubileynaya St., 12" 68 "Shcherbinka, 40 Let Oktyabrya St., 1" 69 "Shcherbinka, Lyublinskaya St., 8" 70 "Shcherbinka, Lyublinskaya St., 4" 71 "Shcherbinka, 40 Let Oktyabrya St., 6/1" 72 "Shcherbinka, Vysotnaya St., 6" 73 "Shcherbinka, Vysotnaya St., 9" 74 "Leningradskoye hwy, 74" 75 "Leningradskoye hwy, 82" 76 "Konakovskiy Proyezd, 15" 77 "Cherepanovykh Proyezd, 58" 78 "4st Novomikhalkovskiy Proyezd, 15" 79 "Cherepanovykh Proyezd, 50a" 80 "Generala Rychagova St., 6" 81 "Generala Rychagova St., 4" 82 "Generala Rychagova St., 3 b.1" 83 "Bol'shaya Akademicheskaya St., 35Б" 84 "Bol'shaya Akademicheskaya St., 35B " 85 "Koptevskiy Bul'var, 6" 86 "Koptevskiy Bul'var, 4" 87 "Matrosa Zheleznyaka Bul'var, 18/12" 88 "Matrosa Zheleznyaka Bul'var, 20 b.1" 89 "Matrosa Zheleznyaka Bul'var, 17/14" 90 "Koptevskiy Bul'var, 4" 91 "Dmitrovskoye Hwy, 15 b.2" 92 "Ivanovskaya St., 14 b.2" 93 "Ivanovskaya St., 22" 94 "1st Rizhskiy Pereulok, 2 b.4" 95 "Novoalekseyevskaya St., 23" 96 "Konstantinova St., 11" 97 "Konstantinova St., 9" 98 "Konstantinova St., 16" 99 "Pavla Korchagina St., 9" 100 "Yablochkova St., 26 b.2" 101 "Yablochkova St., 26 b.1" 102 "Fonvizina St., 11" 103 "2st Mar'inoy Roshchi St., 14б" 104 "2st Proyezd Mar'inoy Roshchi, 17" 105 "2st Mar'inoy Roshchi St., 14 b.A" 106 "Malakhitovaya St., 9" 107 "Rostokinskaya St., 1" 108 "Prospekt Mira, 192" 109 "Polesskiy Proyezd, 6 b.2" 110 "Polesskiy Proyezd, 8" 111 "Polesskiy Proyezd, 6 b.1" 112 "Shishkin Les, 19" 113 "Shishkin Les, 17" 114 "Shishkin Les, 21" 115 "Strel'bishchenskiy Pereulok, 19a" 116 "Podvoyskogo St., 18 b.1" 117 "Podvoyskogo St., 16 b.1" 118 "Litvina-Sedogo St., 10 b.1" 119 "Strel'bishchenskiy Pereulok, 7a" 120 "Strel'bishchenskiy Pereulok, 9a" 121 "Strel'bishchenskiy Pereulok, 7" 122 "Sevastopolskiy Prospekt, 7 b.5" 123 "Sevastopolskiy Prospekt, 7 b.6" 124 "Sevastopolskiy Prospekt, 3 b.2" 125 "Sudostroitel'naya St., 25 b.1" 126 "Sudostroitel'naya St., 21/11" 127 "Sudostroitel'naya St., 27 b.1" 128 "Varshavskoye Hwy, 92" 129 "Varshavskoye Hwy, 98" 130 "Kaspiyskaya St., 28 b.2" 131 "Kaspiyskaya St., 28 b.3" 132 "Kaspiyskaya St., 28 b.1" 133 "Fedora Poletayeva St., 8 b.1" 134 "Fedora Poletayeva St., 8 b.2" 135 "Fedora Poletayeva St., 12" 136 "Aviamotornaya St.,5" 137 "2st Sinichkina  St., 7" 138 "2st Sinichkina  St., 1/2" 139 "Storozhevaya St., 30 b.1" 140 "Storozhevaya St., 30 b.2" 141 "Ukhtomskaya St., 16 b.2" 142 "Prospekt 40 Let Oktyabrya, 6" 143 "Kubanskaya St., 14 b.2" 144 "Sovkhoznaya St., 31" 145 "Novorossiyskaya St., 19" 146 "Novorossiyskaya St., 15" 147 "Sudakova St., 26" 148 "Sudakova St., 25 b.1" 149 "Taganrogskaya St., 11 b.3" 150 "Novorossiyskaya St., 17" 151 "Zarayskaya St., 15" 152 "Konovalova St., 18" 153 "Ryazanskiy Prospekt, 49 b.3" 154 "Ryazanskiy Prospekt, 49 b.2" 155 "Mikhaylova St., 14" 156 "Mikhaylova St., 18 b.1" 157 "Mel'nikova St., 15/10" 158 "Sharikopodshipnikovskaya St., 7 b.2" 159 "Sivashskaya St., 13" 160 "Sivashskaya St., 15" 161 "Azovskaya St., 6 b.1" 162 "Kakhovka St., 15 b.1" 163 "Kakhovka St., 15 b.2" 164 "Kerchenska St., 3" 165 "Profsoyuznaya St., 93 b.1" 166 "Profsoyuznaya St., 110 b.1" 167 "Profsoyuznaya St., 110 b.2" 168 "B. Cheryomushkinskaya St., 15 b.2" 169 "B. Cheryomushkinskaya St., 15 b.3" 170 "Nagornaya St., 15 b. 1,2" 171 "Nagornaya St., 12 b.3" 172 "Nagornaya St., 14 b.2" 173 "Nagornyy Bul'var, 11" 174 "Nagornyy Bul'var, 9" 175 "Remizova St., 10" 176 "Remizova St., 3 b.1" 1001 "Strel'bishchenskiy Pereulok, 25" 1002 "Profsoyuznaya St., 110 b.3" 1003 "Metallurgov St., 44 b.2" 1004 "16 Parkovaya St., 25 b.1" 1005 "Pogonnyi proezd 1 b.10" 1006 "Sudostroitelnaya St., 30" 1007 "Koptevskiy bulvar 4" 1008 "Gvardeiskaya St., 15 b.1", replace
lab val address_id address_id
save "`path'renovation_1400.dta", replace

merge m:1 unom using "`path'raw_data\price_unom.dta"
drop _merge

rename private land_private
rename municipal land_municipal
rename unmarked land_unmarked

gen series_final= reformazkh_serie_all
replace series_final=series_check if series_check!=""
replace series_final="I-511" if address_id==27
replace series_final="I-511" if address_id==1008
replace series_final="" if inlist(address_id,112,114,72,64)
replace series_final="I-515" if inlist(address_id,145,149,150)
replace series_final="I-209A" if inlist(address_id,56)
replace series_final="KPD-4572" if inlist(address_id,61)


save "`path'renovation_1400.dta", replace
