lab var qS1 "R lives in this raion"
label define qS1 1 "Yes" 2 "No", replace

lab var qS2 Gender
label define qS2 1 "Male" 2 "Female", replace

lab var qS3 Age
lab var qS4 Education
label define qS4 1 "Primary or junior high school" 2 "Higher Secondary school" 3 "Vocational school" 4 "Secondary professional education" 5 "Incomplete higher education" 6 "Higher education", replace
lab var q8 "Year since R lives in this house"
lab var q9 "Year since R lives in Moscow"

lab var q10 "Number of rooms in R's apartment"
lab var q11A "Residents over 18 in R's apartment"
lab var q11B "Residents under 18 in R's apartment"
lab var q12 "The apartment that R lives in"
label define q12 1 "Was purchased by R/family members" 2 "Was privatized by R/family members" 3 "R is renting the apartment/room" 4 "R lives under a social contract of employment" 5 "Other", replace
lab var q12_txt "The apartment that R lives in: Other"
lab var q13_1 "Window: Wood"
lab var q13_2 "Window: Plastic, installed before R moved in"
lab var q13_3 "Window: Plastic, installed after R moved in"
lab var q13_4 "Window: Other, installed before R moved in"
lab var q13_5 "Window: Other, installed after R moved in"


lab define q13_1 0 "Not mentioned" 1 "Mentioned", replace 
lab define q13_2 0 "Not mentioned" 1 "Mentioned", replace 
lab define q13_3 0 "Not mentioned" 1 "Mentioned" , replace
lab define q13_4 0 "Not mentioned" 1 "Mentioned" , replace
lab define q13_5 0 "Not mentioned" 1 "Mentioned" , replace

lab var q14_1 "Feel like landlord: Bought"
lab var q14_2 "Feel like landlord: Inherited"
lab var q14_3 "Feel like landlord: Privatized"
lab var q14_4 "Feel like landlord: Social contract"
lab var q14_5 "Feel like landlord: Lived over 15 years"
lab var q14_6 "Feel like landlord: Made improvements"
lab var q14_7 "Feel like landlord: Have the right to privatize"
lab var q14_8 "Feel like landlord: Hard to say"

lab define q14_1 0 "Not mentioned" 1 "Mentioned", replace 
lab define q14_2 0 "Not mentioned" 1 "Mentioned", replace 
lab define q14_3 0 "Not mentioned" 1 "Mentioned" , replace
lab define q14_4 0 "Not mentioned" 1 "Mentioned" , replace
lab define q14_5 0 "Not mentioned" 1 "Mentioned" , replace
lab define q14_6 0 "Not mentioned" 1 "Mentioned" , replace
lab define q14_7 0 "Not mentioned" 1 "Mentioned" , replace
lab define q14_8 0 "Not mentioned" 1 "Mentioned" , replace


lab var q15_1 "Satisfied: The quality of communal services"
lab var q15_2 "Satisfied: The condition of walls, ceilings, elevators, utilities"
lab var q15_3 "Satisfied: The level of lighting in the stairway"

lab define q15_1 1 "Completely satisfied" 2 "Satisfied" 3 "Not satisfied" 4 "Absolutely not satisfied" 99 "Difficult to answer", replace
lab define q15_2 1 "Completely satisfied" 2 "Satisfied" 3 "Not satisfied" 4 "Absolutely not satisfied" 99 "Difficult to answer", replace
lab define q15_3 1 "Completely satisfied" 2 "Satisfied" 3 "Not satisfied" 4 "Absolutely not satisfied" 99 "Difficult to answer", replace

lab var q16_1 "Past year: Participated in meetings (in person or in absentia)"
lab var q16_2 "Past year: Talked to the senior person in the building/stairway"
lab var q16_3 "Past year: Participated in community work days, home improvement activities"
lab var q16_4 "Past year: Participated in the repair, cleaning the entrance hall"
lab var q16_5 "Past year: Participated in organizing events among residents of the house"
lab var q16_6 "Past year: Collected cash contributions for the general needs of the residents"
lab var q16_7 "Past year: Collected signatures"
lab var q16_8 "Past year: Left a signature"
lab var q16_9 "Past year: Participated in the monitoring of order"
lab var q16_10 "Past year: Helped someone from the neighbors in a difficult situation"
lab var q16_11 "Past year: Other"
lab var q16_12 "Past year: None of the above"
lab var q16_txt "Past year: Other (text)"

lab define q16_1 0 "Not mentioned" 1 "Mentioned", replace 
lab define q16_2 0 "Not mentioned" 1 "Mentioned", replace 
lab define q16_3 0 "Not mentioned" 1 "Mentioned" , replace
lab define q16_4 0 "Not mentioned" 1 "Mentioned" , replace
lab define q16_5 0 "Not mentioned" 1 "Mentioned" , replace
lab define q16_6 0 "Not mentioned" 1 "Mentioned" , replace
lab define q16_7 0 "Not mentioned" 1 "Mentioned" , replace
lab define q16_8 0 "Not mentioned" 1 "Mentioned" , replace
lab define q16_9 0 "Not mentioned" 1 "Mentioned" , replace
lab define q16_10 0 "Not mentioned" 1 "Mentioned" , replace
lab define q16_11 0 "Not mentioned" 1 "Mentioned" , replace
lab define q16_12 0 "Not mentioned" 1 "Mentioned" , replace



lab var q17 "How actively R participated in the discussion and decision-making at homeowners meetings"
lab define q17 1 "Passive participation" 5 "Active participation" 99 "Difficult to answer", replace
lab var q18 "How easy is it to reach agreement at the homeowners meetings"
label define q18 1 "Meeting participants are nearly unanimous" 2 "Disagreements arise at meetings, but are easily overcome" 3 "Significant differences arise" 4 "Participants cannot agree" 5 "The meetings cannot come to a decision" 6 "Other (what exactly)", replace
label var q18_txt "Agreement at the homeowners meetings in your building: Other (text)"
label var q19 "Do you think that, in general, can you count on the help of your neighbors"
label define q19 1 "Definitely yes" 2 "Probably yes" 3 "Probably no" 4 "Definitely not" 99 "Difficult to answer", replace
lab var q20_1 "Interacted with neighbors: Phone or visit"
lab var q20_2 "Interacted with neighbors: Resolve issues related to building"
lab var q20_3 "Interacted with neighbors: Helped/were helped to solve some problem"
lab var q20_4 "Interacted with neighbors: Took/gave keys to one's apartment to monitor it"
lab var q20_5 "Interacted with neighbors: Helped with a child"
lab var q20_6 "Interacted with neighbors: Lent food, medicine, household items"
lab var q20_7 "Interacted with neighbors: Communicated during meetings"
lab var q20_8 "Interacted with neighbors: Other"
lab var q20_9 "Interacted with neighbors: Did not communicate"
lab var q20_txt "Interacted with neighbors: Other (text)"

lab define q20_1 0 "Not mentioned" 1 "Mentioned", replace 
lab define q20_2 0 "Not mentioned" 1 "Mentioned", replace 
lab define q20_3 0 "Not mentioned" 1 "Mentioned" , replace
lab define q20_4 0 "Not mentioned" 1 "Mentioned" , replace
lab define q20_5 0 "Not mentioned" 1 "Mentioned" , replace
lab define q20_6 0 "Not mentioned" 1 "Mentioned" , replace
lab define q20_7 0 "Not mentioned" 1 "Mentioned" , replace
lab define q20_8 0 "Not mentioned" 1 "Mentioned" , replace
lab define q20_9 0 "Not mentioned" 1 "Mentioned" , replace






lab var q21 "Discussed politics in conversations with relatives, friends, coworkers"
label define q21 1 "Almost every day" 2 "Several times a week" 3 "Several times a month" 4 "Less often or never" 99 "Difficult to answer", replace
lab var q22_1 "Trust: The President of the Russian Federation Vladimir Putin"
lab var q22_2 "Trust: The Government of the Russian Federation"
lab var q22_3 "Trust: The State Duma"
lab var q22_4 "Trust: The Mayor of Moscow"
lab var q22_5 "Trust: The Moscow City Duma"
lab var q22_6 "Trust: The local uprava"
lab var q22_7 "Trust: The local municipal council"
lab var q22_8 "Trust: The United Russia party"
lab var q22_9 "Trust: Opposition politicians"

lab define q22_1 1 "Completely trust" 2 "Somewhat trust" 3 "Somewhat distrust" 4 "Comletely distrust" 99 "Difficult to answer", replace
lab define q22_2 1 "Completely trust" 2 "Somewhat trust" 3 "Somewhat distrust" 4 "Comletely distrust" 99 "Difficult to answer", replace
lab define q22_3 1 "Completely trust" 2 "Somewhat trust" 3 "Somewhat distrust" 4 "Comletely distrust" 99 "Difficult to answer", replace
lab define q22_4 1 "Completely trust" 2 "Somewhat trust" 3 "Somewhat distrust" 4 "Comletely distrust" 99 "Difficult to answer", replace
lab define q22_5 1 "Completely trust" 2 "Somewhat trust" 3 "Somewhat distrust" 4 "Comletely distrust" 99 "Difficult to answer", replace
lab define q22_6 1 "Completely trust" 2 "Somewhat trust" 3 "Somewhat distrust" 4 "Comletely distrust" 99 "Difficult to answer", replace
lab define q22_7 1 "Completely trust" 2 "Somewhat trust" 3 "Somewhat distrust" 4 "Comletely distrust" 99 "Difficult to answer", replace
lab define q22_8 1 "Completely trust" 2 "Somewhat trust" 3 "Somewhat distrust" 4 "Comletely distrust" 99 "Difficult to answer", replace
lab define q22_9 1 "Completely trust" 2 "Somewhat trust" 3 "Somewhat distrust" 4 "Comletely distrust" 99 "Difficult to answer", replace

lab var q23 "2018 mayoral election vote"
label define q23 1 "R did not know that there were elections" 2 "R did not vote" 3 "R was going to vote, but could not" 4 "Mikhail Balakin" 5 "Mikhail Degtyarev" 6 "Vadim Kumin" 7 "Ilya Sviridov" 8 "Sergei Sobyanin" 9 "Other" 10 "Difficult to answer", replace
lab var q23_txt "2018 mayoral election vote: Other (text)"

lab var q24A_1 "Reasons for voting: Friends or relatives vote for this candidate"
lab var q24A_2 "Reasons for voting: Candidate knows how to work for the benefit of city"
lab var q24A_3 "Reasons for voting: Candidate supported by R's colleagues"
lab var q24A_4 "Reasons for voting: Candidate trusted by Vladimir Putin"
lab var q24A_5 "Reasons for voting: Candidate will help R maintain access to public services"
lab var q24A_6 "Reasons for voting: R trusts the party of the candidate"
lab var q24A_7 "Reasons for voting: R was asked to vote for this candidate by someone important"

lab define q24A_1 0 "Not mentioned" 1 "Mentioned", replace 
lab define q24A_2 0 "Not mentioned" 1 "Mentioned", replace 
lab define q24A_3 0 "Not mentioned" 1 "Mentioned" , replace
lab define q24A_4 0 "Not mentioned" 1 "Mentioned" , replace
lab define q24A_5 0 "Not mentioned" 1 "Mentioned" , replace
lab define q24A_6 0 "Not mentioned" 1 "Mentioned" , replace
lab define q24A_7 0 "Not mentioned" 1 "Mentioned" , replace

lab var q25B_1 "Reasons for not voting: R was not in Moscow"
lab var q25B_2 "Reasons for not voting: R was busy with other things"
lab var q25B_3 "Reasons for not voting: R not interested in politics"
lab var q25B_4 "Reasons for not voting: The winner was known in advance"
lab var q25B_5 "Reasons for not voting: Results do not affect decisions of city authorities"
lab var q25B_6 "Reasons for not voting: No candidate on the ballot for whom R could vote"
lab var q25B_7 "Reasons for not voting: None of the candidates suited R"

lab define q25B_1 0 "Not mentioned" 1 "Mentioned", replace 
lab define q25B_2 0 "Not mentioned" 1 "Mentioned", replace 
lab define q25B_3 0 "Not mentioned" 1 "Mentioned" , replace
lab define q25B_4 0 "Not mentioned" 1 "Mentioned" , replace
lab define q25B_5 0 "Not mentioned" 1 "Mentioned" , replace
lab define q25B_6 0 "Not mentioned" 1 "Mentioned" , replace
lab define q25B_7 0 "Not mentioned" 1 "Mentioned" , replace






lab var q26_1 "Gov should: Provide the sick with essential health services"
lab var q26_2 "Gov should: Provide a decent standard of living for older people"
lab var q26_3 "Gov should: Provide a decent standard of living for the unemployed"
lab var q26_4 "Gov should: Provide housing to all everyone who needs it"
lab var q26_5 "Gov should: Provide quality education to all children"
lab var q26_6 "Gov should: Reduce the income differences between rich and poor"
lab define q26_1 1 "Strongly agree" 2 "Somewhat agree" 3 "Somewhat disagree" 4 "Strongly disagree" 99 "Difficult to answer", replace
lab define q26_2 1 "Strongly agree" 2 "Somewhat agree" 3 "Somewhat disagree" 4 "Strongly disagree" 99 "Difficult to answer", replace
lab define q26_3 1 "Strongly agree" 2 "Somewhat agree" 3 "Somewhat disagree" 4 "Strongly disagree" 99 "Difficult to answer", replace
lab define q26_4 1 "Strongly agree" 2 "Somewhat agree" 3 "Somewhat disagree" 4 "Strongly disagree" 99 "Difficult to answer", replace
lab define q26_5 1 "Strongly agree" 2 "Somewhat agree" 3 "Somewhat disagree" 4 "Strongly disagree" 99 "Difficult to answer", replace
lab define q26_6 1 "Strongly agree" 2 "Somewhat agree" 3 "Somewhat disagree" 4 "Strongly disagree" 99 "Difficult to answer", replace

lab var q27 "State is important source of well-being"
label define q27 1 "No support from the state" 2 "Not a significant source of well-being" 3 "A significant source of well-being" 4 "The only source of well-being" 99 "Difficult to answer", replace
lab var q28_1 "Clearly defined rules: Pensions"
lab var q28_2 "Clearly defined rules: Access to state medical institutions"
lab var q28_3 "Clearly defined rules: Housing benefits"
lab var q28_4 "Politicians generally keep their promises"
lab var q28_5 "The economic and social policies of the state often change"
lab var q28_6 "Civil servants can generally be trusted to comply with the law"
lab define q28_1 1 "Strongly agree" 2 "Somewhat agree" 3 "Somewhat disagree" 4 "Strongly disagree" 99 "Difficult to answer", replace
lab define q28_2 1 "Strongly agree" 2 "Somewhat agree" 3 "Somewhat disagree" 4 "Strongly disagree" 99 "Difficult to answer", replace
lab define q28_3 1 "Strongly agree" 2 "Somewhat agree" 3 "Somewhat disagree" 4 "Strongly disagree" 99 "Difficult to answer", replace
lab define q28_4 1 "Strongly agree" 2 "Somewhat agree" 3 "Somewhat disagree" 4 "Strongly disagree" 99 "Difficult to answer", replace
lab define q28_5 1 "Strongly agree" 2 "Somewhat agree" 3 "Somewhat disagree" 4 "Strongly disagree" 99 "Difficult to answer", replace
lab define q28_6 1 "Strongly agree" 2 "Somewhat agree" 3 "Somewhat disagree" 4 "Strongly disagree" 99 "Difficult to answer", replace


lab var q29_1 "Know about: The renovation program"
lab var q29_2 "Know about: The plan to raise the retirement age"
lab var q29_3 "Know about: My Street program"
lab define q29_1 1 "R is well-informed about it" 2 "R knows something" 3 "R hears the first time" 99 "Difficult to answer", replace
lab define q29_2 1 "R is well-informed about it" 2 "R knows something" 3 "R hears the first time" 99 "Difficult to answer", replace
lab define q29_3 1 "R is well-informed about it" 2 "R knows something" 3 "R hears the first time" 99 "Difficult to answer", replace

lab var q30_1 "Attitude: The renovation program"
lab var q30_2 "Attitude: The plan to raise the retirement age"
lab var q30_3 "Attitude: My Street program"
lab define q30_1 1 "Positive" 2 "Somewhat positive" 3 "Somewhat negative" 4 "Negative" 99 "Difficult to answer", replace
lab define q30_2 1 "Positive" 2 "Somewhat positive" 3 "Somewhat negative" 4 "Negative" 99 "Difficult to answer", replace
lab define q30_3 1 "Positive" 2 "Somewhat positive" 3 "Somewhat negative" 4 "Negative" 99 "Difficult to answer", replace

lab var q31_1 "RP author: The President of the Russian Federation Vladimir Putin"
lab var q31_2 "RP author: The Government of the Russian Federation"
lab var q31_3 "RP author: The State Duma"
lab var q31_4 "RP author: The Mayor of Moscow"
lab var q31_5 "RP author: The Moscow City Duma"
lab var q31_6 "RP author: The local uprava"
lab var q31_7 "RP author: The local munitipal council"
lab var q31_8 "RP author: The United Russia party"
lab var q31_9 "RP author: Opposition politicians"
lab var q31_10 "RP author: None of the above"
lab var q31_11 "RP author: Difficult to answer"
lab define q31_1 0 "Not mentioned" 1 "Mentioned", replace 
lab define q31_2 0 "Not mentioned" 1 "Mentioned", replace 
lab define q31_3 0 "Not mentioned" 1 "Mentioned" , replace
lab define q31_4 0 "Not mentioned" 1 "Mentioned" , replace
lab define q31_5 0 "Not mentioned" 1 "Mentioned" , replace
lab define q31_6 0 "Not mentioned" 1 "Mentioned" , replace
lab define q31_7 0 "Not mentioned" 1 "Mentioned" , replace
lab define q31_8 0 "Not mentioned" 1 "Mentioned" , replace
lab define q31_9 0 "Not mentioned" 1 "Mentioned" , replace
lab define q31_10 0 "Not mentioned" 1 "Mentioned" , replace
lab define q31_11 0 "Not mentioned" 1 "Mentioned" , replace

lab var q31A_1 "In public interest on RP: The President of the Russian Federation Vladimir Putin"
lab var q31A_2 "In public interest on RP: The Government of the Russian Federation"
lab var q31A_3 "In public interest on RP: The State Duma"
lab var q31A_4 "In public interest on RP: The Mayor of Moscow"
lab var q31A_5 "In public interest on RP: The Moscow City Duma"
lab var q31A_6 "In public interest on RP: The local uprava"
lab var q31A_7 "In public interest on RP: The local munitipal council"
lab var q31A_8 "In public interest on RP: The United Russia party"
lab var q31A_9 "In public interest on RP: Opposition politicians"
lab var q31A_10 "In public interest on RP: None of the above"
lab var q31A_11 "In public interest on RP: Difficult to answer"
lab define q31A_1 0 "Not mentioned" 1 "Mentioned", replace 
lab define q31A_2 0 "Not mentioned" 1 "Mentioned", replace 
lab define q31A_3 0 "Not mentioned" 1 "Mentioned" , replace
lab define q31A_4 0 "Not mentioned" 1 "Mentioned" , replace
lab define q31A_5 0 "Not mentioned" 1 "Mentioned" , replace
lab define q31A_6 0 "Not mentioned" 1 "Mentioned" , replace
lab define q31A_7 0 "Not mentioned" 1 "Mentioned" , replace
lab define q31A_8 0 "Not mentioned" 1 "Mentioned" , replace
lab define q31A_9 0 "Not mentioned" 1 "Mentioned" , replace
lab define q31A_10 0 "Not mentioned" 1 "Mentioned" , replace
lab define q31A_11 0 "Not mentioned" 1 "Mentioned" , replace





lab var q31B_1 "RP action: Signed a petition"
lab var q31B_2 "RP action: Participated in a peaceful demonstration"
lab var q31B_3 "RP action: Discussed on the Internet"
lab var q31B_4 "RP action: Voted for a candidate"
lab var q31B_5 "RP action: Discussed with neighbors, friends and colleagues"
lab var q31B_6 "RP action: Meeting with a deputy/party representative"
lab var q31B_7 "RP action: Meeting of an initiative group of citizens"
lab var q31B_8 "RP action: Did not do anything"
lab var q31B_9 "RP action: Difficult to answer"
lab define q31B_1 0 "Not mentioned" 1 "Mentioned", replace 
lab define q31B_2 0 "Not mentioned" 1 "Mentioned", replace 
lab define q31B_3 0 "Not mentioned" 1 "Mentioned" , replace
lab define q31B_4 0 "Not mentioned" 1 "Mentioned" , replace
lab define q31B_5 0 "Not mentioned" 1 "Mentioned" , replace
lab define q31B_6 0 "Not mentioned" 1 "Mentioned" , replace
lab define q31B_7 0 "Not mentioned" 1 "Mentioned" , replace
lab define q31B_8 0 "Not mentioned" 1 "Mentioned" , replace
lab define q31B_9 0 "Not mentioned" 1 "Mentioned" , replace



lab var q32A_1 "Campaign for RP: TV"
lab var q32A_2 "Campaign for RP: Online publications"
lab var q32A_3 "Campaign for RP: Conversations with friends, family, neighbors"
lab var q32A_4 "Campaign for RP: Newspapers and magazines"
lab var q32A_5 "Campaign for RP: Internet social networks"
lab var q32A_6 "Campaign for RP: Leaflets / informational materials in R's entrance hall"
lab var q32A_7 "Campaign for RP: Conversations with administration/management company"
lab var q32A_8 "Campaign for RP: R did not come across anything"
lab define q32A_1 0 "Not mentioned" 1 "Mentioned", replace 
lab define q32A_2 0 "Not mentioned" 1 "Mentioned", replace 
lab define q32A_3 0 "Not mentioned" 1 "Mentioned" , replace
lab define q32A_4 0 "Not mentioned" 1 "Mentioned" , replace
lab define q32A_5 0 "Not mentioned" 1 "Mentioned" , replace
lab define q32A_6 0 "Not mentioned" 1 "Mentioned" , replace
lab define q32A_7 0 "Not mentioned" 1 "Mentioned" , replace
lab define q32A_8 0 "Not mentioned" 1 "Mentioned" , replace

lab var q32B_1 "Campaign against RP: TV"
lab var q32B_2 "Campaign against RP: Online publications"
lab var q32B_3 "Campaign against RP: Conversations with friends, family, neighbors"
lab var q32B_4 "Campaign against RP: Newspapers and magazines"
lab var q32B_5 "Campaign against RP: Internet social networks"
lab var q32B_6 "Campaign against RP: Leaflets / informational materials in R's entrance hall"
lab var q32B_7 "Campaign against RP: Conversations with administration/management company"
lab var q32B_8 "Campaign against RP: R did not come across anything"
lab define q32B_1 0 "Not mentioned" 1 "Mentioned", replace 
lab define q32B_2 0 "Not mentioned" 1 "Mentioned", replace 
lab define q32B_3 0 "Not mentioned" 1 "Mentioned" , replace
lab define q32B_4 0 "Not mentioned" 1 "Mentioned" , replace
lab define q32B_5 0 "Not mentioned" 1 "Mentioned" , replace
lab define q32B_6 0 "Not mentioned" 1 "Mentioned" , replace
lab define q32B_7 0 "Not mentioned" 1 "Mentioned" , replace
lab define q32B_8 0 "Not mentioned" 1 "Mentioned" , replace



lab var q33_1 "Ret reform author: The President of the Russian Federation Vladimir Putin"
lab var q33_2 "Ret reform author: The Government of the Russian Federation"
lab var q33_3 "Ret reform author: The State Duma"
lab var q33_4 "Ret reform author: The United Russia party"
lab var q33_5 "Ret reform author: Other parties"
lab var q33_6 "Ret reform author: Opposition politicians"
lab var q33_7 "Ret reform author: None of the above"
lab var q33_8 "Ret reform author: Difficult to answer"
lab define q33_1 0 "Not mentioned" 1 "Mentioned", replace 
lab define q33_2 0 "Not mentioned" 1 "Mentioned", replace 
lab define q33_3 0 "Not mentioned" 1 "Mentioned" , replace
lab define q33_4 0 "Not mentioned" 1 "Mentioned" , replace
lab define q33_5 0 "Not mentioned" 1 "Mentioned" , replace
lab define q33_6 0 "Not mentioned" 1 "Mentioned" , replace
lab define q33_7 0 "Not mentioned" 1 "Mentioned" , replace
lab define q33_8 0 "Not mentioned" 1 "Mentioned" , replace




lab var q33A_1 "In public interest on ret reform: Vladimir Putin"
lab var q33A_2 "In public interest on ret reform: The Government"
lab var q33A_3 "In public interest on ret reform: The State Duma"
lab var q33A_4 "In public interest on ret reform: The United Russia party"
lab var q33A_5 "In public interest on ret reform: Other parties"
lab var q33A_6 "In public interest on ret reform: Opposition politicians"
lab var q33A_7 "In public interest on ret reform: None of the above"
lab var q33A_8 "In public interest on ret reform: Difficult to answer"
lab define q33A_1 0 "Not mentioned" 1 "Mentioned", replace 
lab define q33A_2 0 "Not mentioned" 1 "Mentioned", replace 
lab define q33A_3 0 "Not mentioned" 1 "Mentioned" , replace
lab define q33A_4 0 "Not mentioned" 1 "Mentioned" , replace
lab define q33A_5 0 "Not mentioned" 1 "Mentioned" , replace
lab define q33A_6 0 "Not mentioned" 1 "Mentioned" , replace
lab define q33A_7 0 "Not mentioned" 1 "Mentioned" , replace
lab define q33A_8 0 "Not mentioned" 1 "Mentioned" , replace




lab var q33B_1 "Ret reform action: Signed a petition"
lab var q33B_2 "Ret reform action:: Participated in a peaceful demonstration"
lab var q33B_3 "Ret reform action:: Discussed on the Internet"
lab var q31B_4 "Ret reform action:: Voted for a candidate"
lab var q33B_5 "Ret reform action:: Discussed with neighbors, friends and colleagues"
lab var q33B_6 "Ret reform action:: Meeting with a deputy/party representative"
lab var q33B_7 "Ret reform action:: Meeting of an initiative group of citizens"
lab var q33B_8 "Ret reform action:: Did not do anything"
lab var q33B_9 "Ret reform action:: Difficult to answer"
lab define q33B_1 0 "Not mentioned" 1 "Mentioned", replace 
lab define q33B_2 0 "Not mentioned" 1 "Mentioned", replace 
lab define q33B_3 0 "Not mentioned" 1 "Mentioned" , replace
lab define q33B_4 0 "Not mentioned" 1 "Mentioned" , replace
lab define q33B_5 0 "Not mentioned" 1 "Mentioned" , replace
lab define q33B_6 0 "Not mentioned" 1 "Mentioned" , replace
lab define q33B_7 0 "Not mentioned" 1 "Mentioned" , replace
lab define q33B_8 0 "Not mentioned" 1 "Mentioned" , replace
lab define q33B_9 0 "Not mentioned" 1 "Mentioned" , replace



lab var q34 "R's vote on renovation"
label define q34 1 "Voting in the house was not held" 2 "Did not vote" 3 "Was about to vote, but could not" 4 "Does not remember voting or not" 5 "Voted against the program" 6 "I voted for the program" 7 "Voted, but does not want to say how" 99 "Difficult to answer", replace

lab var q35 "R's intended vote on renovation - 1"
label define q35 1 "Would not vote" 2 "Would vote against" 3 "Would vote in favor" 99 "Difficult to answer", replace


lab var q37_1 "RP consequences: Infrastructure overloaded"
lab var q37_2 "RP consequences: Participants will receive larger housing"
lab var q37_3 "RP consequences: Property rights will be violated"
lab var q37_4 "RP consequences: Poor transport accessibility"
lab var q37_5 "RP consequences: Participants will receive higher-value housing"
lab var q37_6 "RP consequences: Public officials/ construction business enriched"
lab var q37_7 "RP consequences: Larger housing for voting for the program"
lab var q37_8 "RP consequences: Larger housing for campaigning for the program"
lab var q37_9 "RP consequences: Difficult to answer"

lab define q37_1 0 "Not mentioned" 1 "Mentioned", replace 
lab define q37_2 0 "Not mentioned" 1 "Mentioned", replace 
lab define q37_3 0 "Not mentioned" 1 "Mentioned" , replace
lab define q37_4 0 "Not mentioned" 1 "Mentioned" , replace
lab define q37_5 0 "Not mentioned" 1 "Mentioned" , replace
lab define q37_6 0 "Not mentioned" 1 "Mentioned", replace 
lab define q37_7 0 "Not mentioned" 1 "Mentioned" , replace
lab define q37_8 0 "Not mentioned" 1 "Mentioned" , replace
lab define q37_9 0 "Not mentioned" 1 "Mentioned" , replace



lab var q38 "R's occupation"
label define q38 1 "Independent entrepreneur" 2 "Government employee" 3 "Manager in the public sector" 4 "Manager in the private sector" 5 "Public sector specialist / employee" 6 "Specialist / Employee in private sector / non-public sector" 7 "Worker (including foreman)" 8 "Pupil, student" 9 "Self-employed" 10 "Pensioner" 11 "Housewife" 12 "Unemployed, temporarily not employed", replace
lab var q39 "R's income level"
label define q39 1 "Not enough money even to buy food" 2 "Can buy food, but not clothes" 3 "We have enough money for food and clothing, but buying more expensive items such as a TV or a refrigerator can be a problem" 4 "We can buy some expensive items such as a refrigerator or a TV, but we cannot afford to buy a car" 5 "We can buy a car, but we can’t say that we are not financially" 6 "We can afford anything we need", replace
lab var q41 "R willing to be contacted for future survey"
label define q41 1 "Yes" 2 "No", replace


rename час_нач hour_start
lab var hour_start "Hour of interview, start"
rename час_ок hour_finish
lab var hour_finish "Hour of interview, finish"
rename мин_нач minute_start
lab var minute_start "Minute of interview, start"
rename мин_ок minute_finish
lab var minute_finish "Minute of interview, finish"
rename месяц month
lab var month "Month of interview"
rename день day
lab var day "Day of interview"



lab var IDN "Interview id"
replace IDN= IDN+10000 if month<4


gen male=qS2==1
gen age=qS3
gen higher_ed= qS4==6
gen wood=q13_1
lab var wood "Wood window frames"
gen homeimpr=q13_3==1|q13_5==1

gen rooms=q10
lab var rooms "Number of rooms"


gen per_room=(q11A+q11B+1)/rooms
lab var per_room "No of people per room"
gen apt_bought=q12==1
gen apt_privatized=q12==2
gen trust_putin=(4-q22_1)/3
replace trust_putin=. if q22_1==99
lab var trust_putin "Trusts Russian president (0-1)"
gen trust_sob=(4-q22_4)/3
replace trust_sob=. if q22_4==99
lab var trust_sob "Trusts Moscow mayor (0-1)"
gen ybirth=2019-age
gen born_moscow=abs(ybirth-q8)<2

gen att_renov=(4-q30_1)/3
replace att_renov=. if q30_1==99
lab var att_renov "Attitude towards renovation program (0-1)"
gen att_pens=(4-q30_2)/3
replace att_pens=. if q30_2==99
lab var att_pens "Attitude towards pension reform (0-1)"
gen att_mystr=(4-q30_3)/3
replace att_mystr=. if q30_3==99
lab var att_mystr "Attitude towards My Street program (0-1)"

gen emp_budget=inlist(q38,2,3,5)
gen emp_pens=q38==10
lab var emp_budget "State employee"
lab var emp_pens "Retired"

gen income=(q39-1)/5
replace income=. if q39==0

gen discusspol=(4-q21)/3
replace discusspol=. if q21==99
lab var discusspol "Discuss politics (0-1)"
gen voted_sob=q23==8
lab var voted_sob "Voted for Sobianin in 2018 mayoral"

gen voted_abs=inlist(q23,1,2,3)
lab var voted_abs "Abstained in 2018 mayoral"

gen gov_rely=(q27-1)/3
replace gov_rely=. if q27==99



lab var male Male
lab var higher_ed "Higher ed"
lab var homeimpr "Home improvements"
lab var apt_bought "Apartment was bought"
lab var apt_privatized "Apartment was privatized"
lab var income Income

label define RAION 1 "Bogorodskoye" 2 "Vostochnoye Izmaylovo" 3 "Golyanovo" 4 "Izmaylovo" 5 "Novogireyevo" 6 "Perovo" 7 "Kuntsevo" 8 "Mozhaysky" 9 "Fili-Davydkovo" 10 "Novomoskovsky Administrative Okrug" 11 "Shcherbinka settlement" 12 "Golovinskiy" 13 "Koptevo" 14 "Timiryazevskiy" 15 "Alexeyevsky" 16 "Butyrskiy" 17 "Maryina Roshcha" 18 "Rostokino" 19 "Pokrovskoye-Streshnevo" 20 "Mikhaylovo-Yartsevskoye Poseleniye" 21 "Presnenskiy" 22 "Donskoy" 23 "Nagatinsky Zaton" 24 "Nagornyy" 25 "Tsaritsyno" 26 "Kuzminki" 27 "Lefortovo" 28 "Lyublino" 29 "Ryazanskiy" 30 "Yuzhnoportovy" 31 "Zyuzino" 32 "Konkovo" 33 "Kotlovka" , replace
lab values RAION RAION
