# Renovation survey
### This is the repository for the Moscow Renovation survey project, containing data and replication files for the following papers:
### I. Marques and A. Zakharov (2022) Redistributive policy and redistribution preferences: The effects of Moscow redevelopment program
### E. Borisova, R. Smyth, and A. Zakharov (2022) Autocratic Policy and the Accumulation of Pro-social Norms: The Moscow Housing Renovation Program

\raw_data\renovation_1400_source.sav
\raw_data\renovation_1400_source.dta
\raw_data\renovation_600_source.sav
\raw_data\renovation_600_source.dta - source SPSS files provided by Levada, and their Stata counterparts
\raw_data\renovation_600_coords.dta - coordinates for sampling points for the city-wide sample
\raw_data\unom.dta - Stata file linking Levada address codes with Moscow UNOM address codes

\documentation\Levada report 1400.doc - Report by the Levada Center on the matched survey (in Russian)
\documentation\Levada report 600.doc - Report by the Levada Center on the representative survey (in Russian)
\documentation\Survey instrument - translation.doc - The survey instrument used in the study
\documentation\renovation_erratum.pdf - Erratum to the data collection process

\renovation_600.dta - workfile for the representative sample, compiled from the source data
\renovation_1400.dta - workfile for the matched pairs sample, compiled from the source data 
\compile_workfile_600.do - Stata code to compile the workfile for the respresentative sample
\compile_workfile_1400.do - Stata code to compile the workfile for the matched pairs sample
\relabel.do - Stata code to generate English labels and value labels

\sample\sample_1_comment.xls - output of the within-UIK sampling procedure, with notes and erratum
\sample\sample_2_comment.xls - output of the within-raion sampling procedure, with notes and erratum

\data_sources\August 1 decree.pdf - List of buildings approved for renovation by Moscow Mayor Sobianin on August 1 2017
\data_sources\May 2017 list.pdf - List of buildings where vote on renovation was held on May-June 2017
