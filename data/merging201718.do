cd "/Users/shauryasighadia/Desktop/sem6/ILGC VI/Data Work/asi 2017-18"
use "A.dta",clear
destring *, replace
save "1.dta",replace
use "B.dta",clear
destring *, replace
save "2.dta",replace
use "C.dta"
destring *, replace
reshape wide c_13 c_14 c_15 c_16 c_17 c_18 c_19 c_110 c_111 c_112 c_113 , i(ac01) j(c_11)
save "3.dta",replace
use "D.dta"
destring *, replace
reshape wide d13 d14 , i(ad01) j(d11)
save "4.dta",replace
use "E.dta"
destring *, replace
reshape wide E13 E14 E15 E16 E17 E18 , i( AE01 ) j( E11 )
save "5.dta",replace
use "F.dta"
destring *, replace
save "6.dta",replace
use "G.dta"
destring *, replace
save "7.dta",replace
use "H.dta"
drop if H11>24
destring *, replace
reshape wide H13 H14 H15 H16 H17 , i( AH01 ) j( H11 )
save "8.dta",replace
use "I.dta"
drop if I11 >7
destring *, replace
reshape wide I13 I14 I15 I16 I17 , i( AI01 ) j( I11 )
save "9.dta",replace
use "J.dta"
destring *, replace
sort J01 J11
by J01 J11: gen same=cond(_N==1,0,_n)
drop if same>1
drop same
reshape wide J13 J14 J15 J16 J17 J18 J19 J110 J111 J112 J113 , i( J01 ) j( J11 )
save "10.dta",replace
cd "/Users/shauryasighadia/Desktop/sem6/ILGC VI/Data Work/asi 2017-18"

use "/Users/shauryasighadia/Desktop/sem6/ILGC VI/Data Work/asi 2017-18/1.dta"
rename a1 DSL
save "1.dta", replace
use "2.dta"
rename ab01 DSL
save "2.dta", replace
use "3.dta"
rename ac01 DSL
save "3.dta", replace
use "4.dta"
rename ad01 DSL
save "4.dta", replace
use "5.dta"
rename AE01 DSL
save "5.dta", replace
use "6.dta"
rename AF01 DSL
save "6.dta", replace
use "7.dta"
rename AG01 DSL
save "7.dta", replace
use "8.dta"
rename AH01 DSL
save "8.dta", replace
use "9.dta"
rename AI01 DSL
save "9.dta", replace
use "10.dta"
rename J01 DSL
save "10.dta", replace
use "1.dta",clear
forvalues i=2/10{
merge 1:1 DSL using "`i'.dta"
drop _merge
save "ASI_2017-18_merged.dta",replace
}
clear
use "/Users/shauryasighadia/Desktop/sem6/ILGC VI/Data Work/asi 2017-18/ASI_2017-18_merged.dta"
