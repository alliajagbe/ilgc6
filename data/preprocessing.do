. use "C:/Users/suhan/Desktop/ILGC/ASI/ASI_2017-18_merged.dta"

. drop yr blk a2 a3 a8 a10 a11 a12 bonus pf welfare mwdays nwdays wdays costop expshare mult b02 b03 b04 b05 b06f b06t b07 b08 b09

. drop c_131 c_141 c_151 c_161 c_171 c_181 c_191 c_1101 c_1111 c_1121 c_1131 c_132 c_142 c_152 c_162 c_172 c_182 c_192 c_1102 c_1112 c_1122 c_1132 c_133 c_143 c_153 c_163 c_173 c_183 c_193 c_1103 c_1113 c_1123 c_1133 c_134 c_144 c_154 c_164 c_174 c_184 c_194 c_1104 c_1114 c_1124 c_1134 c_135 c_145 c_155 c_165 c_175 c_185 c_195 c_1105 c_1115 c_1125 c_1135 c_136 c_146 c_156 c_166 c_176 c_186 c_196 c_1106 c_1116 c_1126 c_1136 c_137 c_147 c_157 c_167 c_177 c_187 c_197 c_1107 c_1117 c_1127 c_1137 c_138 c_148 c_158 c_168 c_178 c_188 c_198 c_1108 c_1118 c_1128 c_1138 c_139 c_149 c_159 c_169 c_179 c_189 c_199 c_1109 c_1119 c_1129 c_1139 c_1310 c_1410 c_1510 c_1610 c_1710 c_1810 c_11010 c_11110 c_11210

. drop d131 d141 d132 d142 d133 d143 d134 d144 d135 d145 d137 d147 d138 d148 d139 d149 d1310 d1410 d1311

. drop d1312 d1412 d1313 d1413 d1314 d1414 d1315 d1415 d1316 d1317 d1417

. rename DSL dsl

rename a4 industry_code_1

. rename a5 industry_code_2

. rename a7 state_code

. rename c_11310 total_fixed_assets

. rename d1411 total_current_assets

. rename d1416 working_capital

. rename E165 total_workers

. rename E169 total_employees

. rename E163 sub_total_employees

rename E167 other_employees

rename a9 rural_urban_dummy

. gen total_input = F1 + F2A + F2B + F3 + F4 + F5 + F6 + F7 + H1623 + I167

. gen total_output = J1712 - J1812 + J1912 + J11012 - J11112 + d146 - d136 + G1 + G2 + G3 + G4 + G5 + G6 + G7

. gen gross_value_added = total_output - total_input

. gen net_value_added = gross_value_added - cond(missing(c_1910), 0, c_1910)

. gen net_income = net_value_added - F8 + F9 + F10 + G8 + G9 + G10


. gen profit = net_income - E189

. drop c_1910 d136 d146 E131 E141 E171 E132 E142 E172 E133 E143 E153 E173 E183 E134 E144 E174 E135 E145 E155

. drop E175 E185 E136 E146 E176 E137 E147 E177 E138 E148 E178 E188 E139 E149 E159 E179 

rename E181 male_wages
rename E182 female_wages
rename E184 contrac_wages
rename E186 super_manag_wages
rename E187 other_emp_wages

rename E151 male_days
rename E152 female_days
rename E154 contrac_days
rename E156 super_manag_days
rename E158 unpaid_days
rename E157 other_days


rename E161 male_no
rename E162 female_no
rename E164 contrac_no
rename E166 super_manag_no
rename E168 unpaid_fam

rename E189 total_wages
gen sub_total_super_other = sub_total_employees + super_manag_no + other_employees
gen sub_total_super = sub_total_employees + super_manag_no
gen sub_total_super_other_contrac = sub_total_super_other + contrac_no
. rename F3 operating_expenses

. drop F1 


. rename F7 r_and_d_expenses

gen total_expenses = operating_expenses + r_and_d_expenses
gen workcap_emp_ratio = working_capital/sub_total_employees

gen female_male_ratio = female_no/male_no
gen sub_total_wages = male_wages + female_wages
gen sub_total_super_wages = sub_total_wages + super_manag_wages
gen sub_total_super_other_wages = sub_total_super_wages + other_emp_wages
gen sub_total_super_other_contrac_w = sub_total_super_other_wages + contrac_wages
gen sub_total_days = male_days + female_days
gen total_days = male_days + female_days + super_manag_days + contrac_days + other_days

gen avg_salary_male = male_wages/male_no
gen avg_salary_female = female_wages/female_no
gen avg_salary_contrac = contrac_wages/contrac_no
gen avg_salary_super_manag = super_manag_wages/super_manag_no
gen avg_salary_sub_total = sub_total_wages/sub_total_employees
gen avg_salary_other_emp = other_emp_wages/other_employees

gen contrac_to_total = contrac_no/sub_total_super_other_contrac
gen lab_exp_ratio = total_wages/sub_total_super_other_contrac_w
gen avg_wage_female_to_male = avg_salary_female/avg_salary_male
gen female_to_total_wage = female_wages/sub_total_wages
gen final_expenses = F2A + F2B + operating_expenses + F4 + F5 + F6 + F8 + F9 + F10 
gen lab_exp_ratio_new = total_wages/final_expenses
gen contrac_to_total_mandays = contrac_days/total_days


. drop F11 G1 G2 G3 G4 G5 G6 G7 G8 G9 G10 G11 G12

. drop H131 H141 H151 H161 H171 H132 H142 H152 H162 H172 H133 H143 H153 H163 H173 H134 H144 H154 H164 H174 H135 H145 H155 H165 H175 H136 H146 H156 H166 H176 H137 H147 H157 H167 H177 H138 H148 H158 H168 H178 H139 H149 H159 H169 H179 H1310 H1410 H1510 H1610 H1710 H1311 H1411 H1511 H1611 H1711 H1312 H1412 H1512 H1612 H1712 H1313 H1413 H1513 H1613 H1713 H1314 H1414 H1514 H1614 H1714 H1315 H1415 H1515 H1615 H1715 H1316 H1416 H1516 H1616 H1716 H1317 H1417 H1517 H1617 H1717 H1318 H1418 H1518 H1618 H1718 H1319 H1419 H1519 H1619 H1719 H1320 H1420 H1520 H1620 H1720 H1321 H1421 H1521 H1621 H1721 H1322 H1422 H1522 H1622 H1722 H1323 H1423 H1523 H1623 H1723 H1324 H1424 H1524 H1624 H1724

. drop I131 I141 I151 I161 I171 I132 I142 I152 I162 I172 I133 I143 I153 I163 I173 I134 I144 I154 I164 I174 I135 I145 I155 I165 I175 I136 I146 I156 I166 I176 I137 I147 I157 I167 I177 J131 J141 J151 J161 J171 J181 J191 J1101 J1111 J1121 J1131 J132 J142 J152 J162 J172 J182 J192 J1102 J1112 J1122 J1132 J133 J143 J153 J163 J173 J183 J193 J1103 J1113 J1123 J1133 J134 J144 J154 J164 J174 J184 J194 J1104 J1114 J1124 J1134 J135 J145 J155 J165 J175 J185 J195 J1105 J1115 J1125 J1135 J136 J146 J156 J166 J176 J186 J196 J1106 J1116 J1126 J1136 J137 J147 J157 J167 J177 J187 J197 J1107 J1117 J1127 J1137 J138 J148 J158 J168 J178 J188 J198 J1108 J1118 J1128 J1138 J139 J149 J159 J169 J179 J189 J199 J1109 J1119 J1129 J1139 J1310 J1410 J1510 J1610 J1710 J1810 J1910 J11010 J11110 J11210 J11310 J1311 J1411 J1511 J1611 J1711 J1811 J1911 J11011 J11111 J11211 J11311 J1312 J1412 J1512 J1612 J1712 J1812 J1912 J11012 J11112 J11212 J11312 J1314 J1414 J1514 J1614 J1714 J1814 J1914 J11014 J11114 J11214 J11314 J1315 J1415 J1515 J1615 J1715 J1815 J1915 J11015 J11115 J11215 J11315 J1316 J1416 J1516 J1616 J1716 J1816 J1916 J11016 J11116 J11216 J11316 J1317 J1417 J1517 J1617 J1717 J1817 J1917 J11017 J11117 J11217 J11317 J1318 J1418 J1518 J1618 J1718 J1818 J1918 J11018 J11118 J11218 J11318 J1319 J1419 J1519 J1619 J1719 J1819 J1919 J11019 J11119 J11219 J11319 J1320 J1420 J1520 J1620 J1720 J1820 J1920 J11020 J11120 J11220 J11320 J1321 J1421 J1521 J1621 J1721 J1821 J1921 J11021 J11121 J11221 J11321 J1322 J1422 J1522 J1622 J1722 J1822 J1922 J11022 J11122 J11222 J11322 J1323 J1423 J1523 J1623 J1723 J1823 J1923 J11023 J11123 J11223 J11323 J1324 J1424 J1524 J1624 J1724 J1824 J1924 J11024 J11124 J11224 J11324 J1325 J1425 J1525 J1625 J1725 J1825 J1925 J11025 J11125 J11225 J11325 J1326 J1426 J1526 J1626 J1726 J1826 J1926 J11026 J11126 J11226 J11326 J1327 J1427 J1527 J1627 J1727 J1827 J1927 J11027 J11127 J11227 J11327 J1328 J1428 J1528 J1628 J1728 J1828 J1928 J11028 J11128 J11228 J11328 J1329 J1429 J1529 J1629 J1729 J1829 J1929 J11029 J11129 J11229 J11329 J1330 J1430 J1530 J1630 J1730 J1830 J1930 J11030 J11130 J11230 J11330 J1331 J1431 J1531 J1631 J1731 J1831 J1931 J11031 J11131 J11231 J11331 J1332 J1432 J1532 J1632 J1732 J1832 J1932 J11032 J11132 J11232 J11332 J1333 J1433 J1533 J1633 J1733 J1833 J1933 J11033 J11133 J11233 J11333 J1334 J1434 J1534 J1634 J1734 J1834 J1934 J11034 J11134 J11234 J11334 J1335 J1435 J1535 J1635 J1735 J1835 J1935 J11035 J11135 J11235 J11335

. drop if missing(total_workers)

. save "preprocessed.dta" , replace 