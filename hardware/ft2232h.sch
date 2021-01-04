EESchema Schematic File Version 4
LIBS:icepool-board-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 6
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Interface_USB:FT2232H U?
U 1 1 5FF76398
P 4450 3200
F 0 "U?" H 4450 5581 50  0000 C CNN
F 1 "FT2232H" H 4450 5490 50  0000 C CNN
F 2 "" H 4450 3200 50  0001 C CNN
F 3 "http://www.ftdichip.com/Products/ICs/FT2232H.html" H 4450 3200 50  0001 C CNN
	1    4450 3200
	1    0    0    -1  
$EndComp
$Comp
L Connector:USB_B_Micro J?
U 1 1 5FF7639E
P 1700 1550
F 0 "J?" H 1757 2017 50  0000 C CNN
F 1 "USB_B_Micro" H 1757 1926 50  0000 C CNN
F 2 "" H 1850 1500 50  0001 C CNN
F 3 "~" H 1850 1500 50  0001 C CNN
	1    1700 1550
	1    0    0    -1  
$EndComp
Text Label 2200 2950 0    50   ~ 0
CLK
Wire Wire Line
	1550 2950 1500 2950
Wire Wire Line
	1500 2650 1850 2650
Connection ~ 1500 2650
$Comp
L Device:C_Small C?
U 1 1 5FF763A8
P 1300 3050
AR Path="/5FF763A8" Ref="C?"  Part="1" 
AR Path="/5D74F1A4/5FF763A8" Ref="C?"  Part="1" 
AR Path="/5D7C5399/5FF763A8" Ref="C?"  Part="1" 
AR Path="/5E9AF0AF/5FF763A8" Ref="C?"  Part="1" 
AR Path="/5E9AF0BC/5FF763A8" Ref="C?"  Part="1" 
AR Path="/5FC264E9/5FF763A8" Ref="C?"  Part="1" 
AR Path="/5FFA49FD/5FF763A8" Ref="C?"  Part="1" 
AR Path="/5FF26697/5FF763A8" Ref="C?"  Part="1" 
F 0 "C?" H 1208 3004 50  0000 R CNN
F 1 "0.01u" H 1208 3095 50  0000 R CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 1300 3050 50  0001 C CNN
F 3 "~" H 1300 3050 50  0001 C CNN
	1    1300 3050
	-1   0    0    1   
$EndComp
Wire Wire Line
	1300 2650 1500 2650
Wire Wire Line
	1300 3300 1850 3300
Wire Wire Line
	1850 3300 1850 3250
Connection ~ 1850 3300
Wire Wire Line
	1850 3300 1850 3350
$Comp
L power:GND #PWR?
U 1 1 5FF763B3
P 1850 3350
AR Path="/5FF763B3" Ref="#PWR?"  Part="1" 
AR Path="/5D74F1A4/5FF763B3" Ref="#PWR?"  Part="1" 
AR Path="/5D7C5399/5FF763B3" Ref="#PWR?"  Part="1" 
AR Path="/5E9AF0AF/5FF763B3" Ref="#PWR?"  Part="1" 
AR Path="/5E9AF0BC/5FF763B3" Ref="#PWR?"  Part="1" 
AR Path="/5FC264E9/5FF763B3" Ref="#PWR?"  Part="1" 
AR Path="/5FFA49FD/5FF763B3" Ref="#PWR?"  Part="1" 
AR Path="/5FF26697/5FF763B3" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1850 3100 50  0001 C CNN
F 1 "GND" H 1855 3177 50  0000 C CNN
F 2 "" H 1850 3350 50  0001 C CNN
F 3 "" H 1850 3350 50  0001 C CNN
	1    1850 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 2950 1300 2650
Wire Wire Line
	1300 3300 1300 3150
Wire Wire Line
	2150 2950 2300 2950
Wire Notes Line
	1000 2300 2700 2300
Wire Notes Line
	2700 2300 2700 3650
Wire Notes Line
	2700 3650 1000 3650
Wire Notes Line
	1000 3650 1000 2300
Wire Wire Line
	1500 2950 1500 2650
$Comp
L Oscillator:ASV-xxxMHz X?
U 1 1 5FF763C1
P 1850 2950
AR Path="/5FF763C1" Ref="X?"  Part="1" 
AR Path="/5D74F1A4/5FF763C1" Ref="X?"  Part="1" 
AR Path="/5D7C5399/5FF763C1" Ref="X?"  Part="1" 
AR Path="/5E9AF0AF/5FF763C1" Ref="X?"  Part="1" 
AR Path="/5E9AF0BC/5FF763C1" Ref="X?"  Part="1" 
AR Path="/5FC264E9/5FF763C1" Ref="X?"  Part="1" 
AR Path="/5FFA49FD/5FF763C1" Ref="X?"  Part="1" 
AR Path="/5FF26697/5FF763C1" Ref="X?"  Part="1" 
F 0 "X?" H 1900 3450 50  0000 L CNN
F 1 "ASEM1-12.000MHZ" H 1600 3350 50  0000 L CNN
F 2 "Oscillator:Oscillator_SMD_Abracon_ASE-4Pin_3.2x2.5mm" H 2550 2600 50  0001 C CNN
F 3 "http://www.abracon.com/Oscillators/ASV.pdf" H 1750 2950 50  0001 C CNN
	1    1850 2950
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5FF763C7
P 2300 3150
AR Path="/5FF763C7" Ref="C?"  Part="1" 
AR Path="/5D74F1A4/5FF763C7" Ref="C?"  Part="1" 
AR Path="/5D7C5399/5FF763C7" Ref="C?"  Part="1" 
AR Path="/5E9AF0AF/5FF763C7" Ref="C?"  Part="1" 
AR Path="/5E9AF0BC/5FF763C7" Ref="C?"  Part="1" 
AR Path="/5FC264E9/5FF763C7" Ref="C?"  Part="1" 
AR Path="/5FFA49FD/5FF763C7" Ref="C?"  Part="1" 
AR Path="/5FF26697/5FF763C7" Ref="C?"  Part="1" 
F 0 "C?" H 2208 3104 50  0000 R CNN
F 1 "OMIT" H 2208 3195 50  0000 R CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 2300 3150 50  0001 C CNN
F 3 "~" H 2300 3150 50  0001 C CNN
	1    2300 3150
	-1   0    0    1   
$EndComp
Wire Wire Line
	2300 3050 2300 2950
Connection ~ 2300 2950
Wire Wire Line
	2300 3250 2300 3300
Wire Wire Line
	2300 3300 1850 3300
Wire Wire Line
	2300 2950 2500 2950
Text Notes 2300 3600 0    50   ~ 0
Oscillator
Text Notes 1050 3600 0    50   ~ 0
Cpin = 6pF\nCload <= 15pF
Text HLabel 1450 2500 0    50   Input ~ 0
VCCIO
Wire Wire Line
	1450 2500 1500 2500
Wire Wire Line
	1500 2500 1500 2650
$EndSCHEMATC
