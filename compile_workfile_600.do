*  Compiles the N=600 workfile from sources and generates variables

clear
*local path="C:\Users\avzakharov\Dropbox\research\renovation_folder\"
*local path="C:\Users\ProfCy\Dropbox\renovation_folder\"
local path="C:\Users\0\Dropbox\research\renovation_folder\"
use "`path'raw_data\renovation_600_source.dta", clear

do "`path'relabel.do"
lab var qS5 "R's house in the renovation program"
label define qS5 1 "Yes" 2 "No", replace

lab var q36 "R's intended vote on renovation - 2"
label define q36 1 "Would not vote" 2 "Would vote against" 3 "Would vote in favor" 99 "Difficult to answer", replace

lab var RAION RAION
label define RAION 1 "Vostochnoye Izmaylovo" 2 "Izmaylovo" 3 "Novokosino" 4 "Sokolinaya Gora" 5 "Krylatskoye" 6 "Novo-Peredelkino" 7 "Ramenki" 8 "Filyovsky Park" 9 "Savelki" 10 "Beskudnikovskoe" 11 "Zapadnoye Degunino" 12 "Sokol" 13 "Babushkinskoe" 14 "Losinoostrovskoe" 15 "Otradnoye" 16 "Yuzhnoye Medvedkovo" 17 "Mitino" 18 "Strogino" 19 "Yuzhnoye Tushino" 20 "Basmannoe" 21 "Presnenskoe" 22 "Vykhino-Zhulebino" 23 "Lefortovo" 24 "Nizhegorodskoe" 25 "Tekstilshchiki" 26 "Akademicheskoe" 27 "Konkovo" 28 "Obruchevskoe" 29 "Cheryomushki" 30 "Biryulyovo Vostochnoye" 31 "Danilovskoe" 32 "Nagatino-Sadovniki" 33 "Orekhovo-Borisovo Severnoye" 34 "Chertanovo Tsentral'noye", replace

merge m:1 RAION using "`path'raw_data\raion_data.dta"
drop _merge

merge m:1 RAION using "`path'raw_data\renovation_600_coords.dta"
drop _merge

save "`path'renovation_600.dta", replace
