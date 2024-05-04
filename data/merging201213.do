cd "/Users/shauryasighadia/Desktop/sem6/ILGC VI/Data Work/asi 2012-13"
use "A.dta",clear
destring *, replace
save "1.dta",replace
use "B.dta",clear
destring *, replace
save "2.dta",replace
use "C.dta"
destring *, replace
reshape wide Grossopn Revaluation ActAdd DedAdj GrossCl yearbeg Provdyear Adjyear yearend NetValOp NetValCl , i(DSL) j(SNO)
save "3.dta",replace
use "D.dta"
destring *, replace
reshape wide WorkCapOp WorkCapCl , i(DSL) j(Sno)
save "4.dta",replace
use "E.dta"
destring *, replace
reshape wide MManDay NMManDay TManDay AvgPersonWork MandaysPaid Wages , i( DSL ) j( Sno )
save "5.dta",replace
use "F.dta"
destring *, replace
save "6.dta",replace
use "G.dta"
destring *, replace
save "7.dta",replace
use "H.dta"
drop if Sno>24
destring *, replace
reshape wide ItemCode Unitcode QtyCons PurVal RateperUnit , i( DSL ) j( Sno )
save "8.dta",replace
use "I.dta"
drop if Sno>7
destring *, replace
reshape wide ItemCode Unitcode QtyCons Purvaldel Rateperunit , i( DSL ) j( Sno )
save "9.dta",replace
use "J.dta"
destring *, replace
sort DSL Sno 
by DSL Sno: gen same=cond(_N==1,0,_n)
drop if same>1
drop same
reshape wide ItemCode Unitcode QtyManuf QtySold Grosssalval ExciseDuty SalesTax Others Total NetSaleval ExfactvalOutput , i( DSL ) j( Sno )
save "10.dta",replace
use "1.dta",clear
forvalues i=2/10{
merge 1:1 DSL using "`i'.dta"
drop _merge
save "ASI_2012-13_merged.dta",replace
}
clear
use "/Users/shauryasighadia/Desktop/sem6/ILGC VI/Data Work/asi 2012-13/ASI_2012-13_merged.dta"
