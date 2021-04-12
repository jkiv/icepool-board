EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 5
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	1000 3600 1200 3600
Wire Wire Line
	1000 3550 1000 3600
$Comp
L power:+12V #PWR0187
U 1 1 605C9BF8
P 1000 3550
F 0 "#PWR0187" H 1000 3400 50  0001 C CNN
F 1 "+12V" H 1015 3723 50  0000 C CNN
F 2 "" H 1000 3550 50  0001 C CNN
F 3 "" H 1000 3550 50  0001 C CNN
	1    1000 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:Jumper_NO_Small JP3
U 1 1 605C2EF6
P 1300 3600
F 0 "JP3" H 1300 3785 50  0000 C CNN
F 1 "FSW" H 1300 3694 50  0000 C CNN
F 2 "jkiv-library:J_NO_0201_0603Metric" H 1300 3600 50  0001 C CNN
F 3 "~" H 1300 3600 50  0001 C CNN
	1    1300 3600
	1    0    0    -1  
$EndComp
Text Label 1400 3600 0    50   ~ 0
DEF
Wire Wire Line
	1400 3600 1550 3600
Text Notes 950  3800 0    50   ~ 0
Connect for +5% output voltage
Connection ~ 2050 1300
Wire Wire Line
	1750 1300 2050 1300
Wire Wire Line
	2050 1300 2050 1650
Wire Wire Line
	1750 1550 1750 1600
Connection ~ 1400 1600
Wire Wire Line
	1400 1600 1750 1600
Connection ~ 1400 1300
Wire Wire Line
	1400 1300 1750 1300
Connection ~ 1750 1300
Wire Wire Line
	1750 1350 1750 1300
$Comp
L Device:C_Small C39
U 1 1 6058663E
P 1750 1450
F 0 "C39" H 1842 1496 50  0000 L CNN
F 1 "0.1u" H 1842 1405 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1750 1450 50  0001 C CNN
F 3 "~" H 1750 1450 50  0001 C CNN
	1    1750 1450
	1    0    0    -1  
$EndComp
Text Notes 1600 1100 0    50   ~ 0
10u between PVIN-PGND\n0.1u between AVIN-AGND
Text Notes 950  3050 0    50   ~ 0
Connect for lower-frequency,\nhigher-efficiency operation.
Wire Wire Line
	3950 1650 4350 1650
Wire Wire Line
	3950 1950 4350 1950
Wire Wire Line
	4350 1900 4350 1950
Wire Wire Line
	4350 1700 4350 1650
$Comp
L Device:R_Small_US R23
U 1 1 60551BBC
P 4350 1800
F 0 "R23" H 4418 1846 50  0000 L CNN
F 1 "100k" H 4418 1755 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 4350 1800 50  0001 C CNN
F 3 "~" H 4350 1800 50  0001 C CNN
	1    4350 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 2800 950  2800
Wire Wire Line
	1250 2800 1400 2800
Text Label 1050 2800 2    50   ~ 0
PG
Text Label 1250 2800 0    50   ~ 0
FSW
Wire Wire Line
	2100 1950 1950 1950
Wire Wire Line
	2100 1850 1950 1850
Wire Wire Line
	1600 1750 2100 1750
$Comp
L Device:C_Small C38
U 1 1 60450CDD
P 1600 1900
F 0 "C38" H 1692 1946 50  0000 L CNN
F 1 "3.3u" H 1692 1855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1600 1900 50  0001 C CNN
F 3 "~" H 1600 1900 50  0001 C CNN
	1    1600 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 1800 1600 1750
$Comp
L power:GND #PWR0188
U 1 1 604574A7
P 1600 2050
F 0 "#PWR0188" H 1600 1800 50  0001 C CNN
F 1 "GND" H 1605 1877 50  0000 C CNN
F 2 "" H 1600 2050 50  0001 C CNN
F 3 "" H 1600 2050 50  0001 C CNN
	1    1600 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 2050 1600 2000
Text Label 2100 1950 2    50   ~ 0
FSW
Text Label 2100 1850 2    50   ~ 0
DEF
$Comp
L Device:Jumper_NO_Small JP2
U 1 1 604EBEE1
P 1150 2800
F 0 "JP2" H 1150 2985 50  0000 C CNN
F 1 "FSW" H 1150 2894 50  0000 C CNN
F 2 "jkiv-library:J_NO_0201_0603Metric" H 1150 2800 50  0001 C CNN
F 3 "~" H 1150 2800 50  0001 C CNN
	1    1150 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 1600 1100 1550
Connection ~ 1100 1600
Wire Wire Line
	1400 1600 1400 1550
Wire Wire Line
	1100 1600 1400 1600
Wire Wire Line
	1100 1650 1100 1600
$Comp
L power:GND #PWR0189
U 1 1 604E02F2
P 1100 1650
F 0 "#PWR0189" H 1100 1400 50  0001 C CNN
F 1 "GND" H 1105 1477 50  0000 C CNN
F 2 "" H 1100 1650 50  0001 C CNN
F 3 "" H 1100 1650 50  0001 C CNN
	1    1100 1650
	1    0    0    -1  
$EndComp
Connection ~ 1100 1300
Wire Wire Line
	1400 1300 1100 1300
Wire Wire Line
	1400 1350 1400 1300
Wire Wire Line
	1100 1300 1100 1350
Wire Wire Line
	3950 1700 3950 1650
Connection ~ 3550 1650
Wire Wire Line
	3550 1700 3550 1650
Wire Wire Line
	2900 1950 3550 1950
Wire Wire Line
	3550 1950 3550 1900
$Comp
L Device:R_Small_US R22
U 1 1 6046C97A
P 3550 1800
F 0 "R22" H 3618 1846 50  0000 L CNN
F 1 "100k" H 3618 1755 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 3550 1800 50  0001 C CNN
F 3 "~" H 3550 1800 50  0001 C CNN
	1    3550 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 1650 3550 1650
$Comp
L Device:C_Small C41
U 1 1 6040A27F
P 3950 1800
F 0 "C41" H 4042 1846 50  0000 L CNN
F 1 "22u" H 4042 1755 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric" H 3950 1800 50  0001 C CNN
F 3 "~" H 3950 1800 50  0001 C CNN
	1    3950 1800
	1    0    0    -1  
$EndComp
Connection ~ 3950 1650
Wire Wire Line
	3950 1900 3950 1950
Connection ~ 3950 1950
$Comp
L power:GND #PWR0190
U 1 1 60422E5F
P 3950 2050
F 0 "#PWR0190" H 3950 1800 50  0001 C CNN
F 1 "GND" H 3955 1877 50  0000 C CNN
F 2 "" H 3950 2050 50  0001 C CNN
F 3 "" H 3950 2050 50  0001 C CNN
	1    3950 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 2050 3950 1950
Connection ~ 3300 1650
Wire Wire Line
	2900 1650 3000 1650
Wire Wire Line
	3300 1650 3300 1850
Wire Wire Line
	2900 1850 3300 1850
Connection ~ 2600 2400
Wire Wire Line
	2950 2050 2900 2050
Wire Wire Line
	2950 2400 2950 2050
Wire Wire Line
	2600 2400 2950 2400
Wire Wire Line
	2600 2400 2600 2350
Wire Wire Line
	2500 2400 2600 2400
Connection ~ 2500 2400
Wire Wire Line
	2500 2400 2500 2350
Wire Wire Line
	2400 2400 2400 2350
Wire Wire Line
	2500 2400 2400 2400
Wire Wire Line
	2500 2450 2500 2400
$Comp
L power:GND #PWR0191
U 1 1 6042679D
P 2500 2450
F 0 "#PWR0191" H 2500 2200 50  0001 C CNN
F 1 "GND" H 2505 2277 50  0000 C CNN
F 2 "" H 2500 2450 50  0001 C CNN
F 3 "" H 2500 2450 50  0001 C CNN
	1    2500 2450
	1    0    0    -1  
$EndComp
$Comp
L Device:L_Small L1
U 1 1 60408660
P 3100 1650
F 0 "L1" V 3300 1650 50  0000 C CNN
F 1 "2.2u" V 3200 1650 50  0000 C CNN
F 2 "Inductor_SMD:L_Vishay_IHLP-1212" H 3100 1650 50  0001 C CNN
F 3 "IHLP1212BZER2R2M11" H 3100 1650 50  0001 C CNN
	1    3100 1650
	0    -1   -1   0   
$EndComp
Text Label 2950 1850 0    50   ~ 0
SENSE
Text Label 2950 1950 0    50   ~ 0
PG
$Comp
L Device:CP1_Small C15
U 1 1 603F333B
P 1100 1450
F 0 "C15" H 1191 1496 50  0000 L CNN
F 1 "47u" H 1191 1405 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_8x10" H 1100 1450 50  0001 C CNN
F 3 "~" H 1100 1450 50  0001 C CNN
	1    1100 1450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C37
U 1 1 603F30D5
P 1400 1450
F 0 "C37" H 1492 1496 50  0000 L CNN
F 1 "10u" H 1492 1405 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric" H 1400 1450 50  0001 C CNN
F 3 "~" H 1400 1450 50  0001 C CNN
	1    1400 1450
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0192
U 1 1 603F15B4
P 1100 1200
F 0 "#PWR0192" H 1100 1050 50  0001 C CNN
F 1 "+12V" H 1115 1373 50  0000 C CNN
F 2 "" H 1100 1200 50  0001 C CNN
F 3 "" H 1100 1200 50  0001 C CNN
	1    1100 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 1300 1100 1200
Wire Wire Line
	2050 1300 2400 1300
Wire Wire Line
	2100 1650 2050 1650
Wire Wire Line
	2400 1300 2600 1300
Connection ~ 2400 1300
Wire Wire Line
	2400 1300 2400 1350
Wire Wire Line
	2600 1350 2600 1300
Text Notes 2750 2500 0    50   ~ 0
FB to AGND for fixed Vout
$Comp
L Regulator_Switching:TPS62133 U3
U 1 1 603E3A4F
P 2500 1850
F 0 "U3" H 2500 2531 50  0000 C CNN
F 1 "TPS62132" H 2500 2440 50  0000 C CNN
F 2 "Package_DFN_QFN:VQFN-16-1EP_3x3mm_P0.5mm_EP1.68x1.68mm_ThermalVias" H 2650 1400 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/tps62130.pdf" H 2500 1850 50  0001 C CNN
	1    2500 1850
	1    0    0    -1  
$EndComp
Text Notes 1050 850  0    50   ~ 0
12V to 3.3V 3A buck: TPS62132
Text Notes 3000 1350 0    50   ~ 0
IHLP1212BZER2R2M11
Wire Wire Line
	4350 1650 4350 1550
Connection ~ 4350 1650
$Comp
L Device:R_Small_US R21
U 1 1 6061EC53
P 700 1450
F 0 "R21" H 768 1496 50  0000 L CNN
F 1 "100k" H 768 1405 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 700 1450 50  0001 C CNN
F 3 "~" H 700 1450 50  0001 C CNN
	1    700  1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 1300 700  1300
Wire Wire Line
	700  1300 700  1350
Wire Wire Line
	700  1550 700  1600
Wire Wire Line
	700  1600 1100 1600
Wire Wire Line
	3550 1650 3950 1650
Wire Wire Line
	3200 1650 3300 1650
Text Label 2900 1650 0    50   ~ 0
SW
$Comp
L power:+3V3 #PWR0172
U 1 1 60782BF4
P 4350 1550
F 0 "#PWR0172" H 4350 1400 50  0001 C CNN
F 1 "+3V3" H 4365 1723 50  0000 C CNN
F 2 "" H 4350 1550 50  0001 C CNN
F 3 "" H 4350 1550 50  0001 C CNN
	1    4350 1550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60F24E89
P 5200 2300
AR Path="/5FF26697/60F24E89" Ref="#PWR?"  Part="1" 
AR Path="/5FF26697/5FF520B9/60F24E89" Ref="#PWR0174"  Part="1" 
F 0 "#PWR0174" H 5200 2050 50  0001 C CNN
F 1 "GND" H 5205 2127 50  0000 C CNN
F 2 "" H 5200 2300 50  0001 C CNN
F 3 "" H 5200 2300 50  0001 C CNN
	1    5200 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R?
U 1 1 60F24E8F
P 5200 1700
AR Path="/5FF26697/60F24E8F" Ref="R?"  Part="1" 
AR Path="/5FF26697/5FF520B9/60F24E8F" Ref="R25"  Part="1" 
F 0 "R25" H 5268 1746 50  0000 L CNN
F 1 "4k7" H 5268 1655 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 5200 1700 50  0001 C CNN
F 3 "~" H 5200 1700 50  0001 C CNN
	1    5200 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 1900 5200 1800
$Comp
L Device:LED D?
U 1 1 60F24E96
P 5200 2050
AR Path="/5FF26697/60F24E96" Ref="D?"  Part="1" 
AR Path="/5FF26697/5FF520B9/60F24E96" Ref="D3"  Part="1" 
F 0 "D3" V 5150 1950 50  0000 R CNN
F 1 "PWRLED" V 5250 1950 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric" H 5200 2050 50  0001 C CNN
F 3 "~" H 5200 2050 50  0001 C CNN
	1    5200 2050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5200 1500 5200 1600
Wire Wire Line
	5200 2300 5200 2200
$Comp
L power:+3V3 #PWR?
U 1 1 60F24E9E
P 5200 1500
AR Path="/5FF26697/60F24E9E" Ref="#PWR?"  Part="1" 
AR Path="/5FF26697/5FF520B9/60F24E9E" Ref="#PWR0175"  Part="1" 
F 0 "#PWR0175" H 5200 1350 50  0001 C CNN
F 1 "+3V3" H 5215 1673 50  0000 C CNN
F 2 "" H 5200 1500 50  0001 C CNN
F 3 "" H 5200 1500 50  0001 C CNN
	1    5200 1500
	1    0    0    -1  
$EndComp
$EndSCHEMATC
