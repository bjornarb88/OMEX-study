## OMEX primary analysis code ## 
# Example code for linear mixed models for continues outcomes (baseline adjustment according to Twisk 2018)
# Example code for modified possion regression for binary outcomes (according to Zou 2004 )
********************************************************************************
* 1) OARSI sum score *
********************************************************************************
import delimited "/prepared_datasets/omex_oarsi.csv", clear

mixed oarsi_sum_inj i.time i.gender i.treat#i(60,120).time || id: 

********************************************************************************
* 2) KOOS *
********************************************************************************
import delimited "/prepared_datasets/omex_koos.csv", clear

* KOOS4 *
mixed koos4 i.time i.sex i.treat#i(3,12,24,60,120).time || id: 

* Pain *
mixed pain i.time i.sex i.treat#i(3,12,24,60,120).time || id:

* Symptoms *
mixed symp i.time i.sex i.treat#i(3,12,24,60,120).time || id: 

* ADL *
mixed adl i.time i.sex i.treat#i(3,12,24,60,120).time || id: 

* Sport/rec *
mixed sport i.time i.sex i.treat#i(3,12,24,60,120).time || id:

* QOL * 
mixed qol i.time i.sex i.treat#i(3,12,24,60,120).time || id:

********************************************************************************
* 3) Knee muscle strength *
********************************************************************************
import delimited "/prepared_datasets/omex_isokinetic.csv", clear

* Quadriceps *
mixed pt_ext i.time i.sex i.treat#i(3,12,60,120).time || id: 

* Hamstrings *
mixed pt_flex i.time i.sex i.treat#i(3,12,60,120).time || id: 


********************************************************************************
* 4) Knee OA incidence *
********************************************************************************
import delimited "/prepared_datasets/omex_kl.csv", clear

* Radiographic *
glm oa_inc_inj_10y i.gender ib666.treat, fam(poisson) link(log) vce(robust) nolog eform
margins, dydx(intervention)


* Symptomatic *
glm oa_sympt_inc_10y i.gender ib666.treat, fam(poisson) link(log) vce(robust) nolog eform
margins, dydx(intervention)

clear 
********************************************************************************
********************************************************************************
********************************************************************************
