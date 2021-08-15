EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 6
Title "icepool-board"
Date "2021-08-15"
Rev "CM4"
Comp "fourside.io"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L jkiv-lattice:iCE40HX8K-BG121(121-Ball_caBGA) U?
U 2 1 5D750F66
P 8950 1700
AR Path="/5D7C5399/5D750F66" Ref="U?"  Part="2" 
AR Path="/5D74F1A4/5D750F66" Ref="U?"  Part="2" 
AR Path="/5E9AF0AF/5D750F66" Ref="U?"  Part="2" 
AR Path="/5E9AF0BC/5D750F66" Ref="U?"  Part="2" 
AR Path="/5FC264E9/5D750F66" Ref="U?"  Part="2" 
AR Path="/5FFA49FD/5D750F66" Ref="U?"  Part="2" 
AR Path="/60023325/60024B6C/5D750F66" Ref="U8"  Part="2" 
F 0 "U8" H 8950 2687 60  0000 C CNN
F 1 "iCE40HX8K-BG121(121-Ball_caBGA)" H 8950 2581 60  0000 C CNN
F 2 "jkiv-library:BGA-121_11x11_9.0x9.0mm" H 8950 1200 60  0001 C CNN
F 3 "" H 8950 1200 60  0000 C CNN
	2    8950 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 1050 1450 1050
Wire Wire Line
	1950 1150 1450 1150
Connection ~ 1450 1150
Wire Wire Line
	1450 1150 1450 1050
Wire Wire Line
	1950 1250 1450 1250
Connection ~ 1450 1250
Wire Wire Line
	1450 1250 1450 1150
Wire Wire Line
	1950 1350 1600 1350
Connection ~ 1450 1350
Wire Wire Line
	1450 1350 1450 1250
Wire Wire Line
	1950 2450 1450 2450
Wire Wire Line
	3700 1350 3700 1250
Connection ~ 3700 1150
Wire Wire Line
	3700 1150 3700 1050
Connection ~ 3700 1250
Wire Wire Line
	3700 1250 3700 1150
Wire Wire Line
	3700 1450 3700 1550
Connection ~ 3700 2350
Wire Wire Line
	3700 2350 3700 2600
Connection ~ 3700 2250
Wire Wire Line
	3700 2250 3700 2350
Connection ~ 3700 2150
Wire Wire Line
	3700 2150 3700 2250
Connection ~ 3700 2050
Wire Wire Line
	3700 2050 3700 2150
Connection ~ 3700 1950
Wire Wire Line
	3700 1950 3700 2050
Connection ~ 3700 1850
Wire Wire Line
	3700 1850 3700 1950
Connection ~ 3700 1750
Wire Wire Line
	3700 1750 3700 1850
Connection ~ 3700 1650
Wire Wire Line
	3700 1650 3700 1750
Connection ~ 3700 1550
Wire Wire Line
	3700 1550 3700 1650
$Comp
L power:GND #PWR?
U 1 1 5D7AA375
P 3700 2600
AR Path="/5D7C5399/5D7AA375" Ref="#PWR?"  Part="1" 
AR Path="/5D74F1A4/5D7AA375" Ref="#PWR?"  Part="1" 
AR Path="/5E9AF0AF/5D7AA375" Ref="#PWR?"  Part="1" 
AR Path="/5E9AF0BC/5D7AA375" Ref="#PWR?"  Part="1" 
AR Path="/5FC264E9/5D7AA375" Ref="#PWR?"  Part="1" 
AR Path="/5FFA49FD/5D7AA375" Ref="#PWR?"  Part="1" 
AR Path="/60023325/60024B6C/5D7AA375" Ref="#PWR069"  Part="1" 
F 0 "#PWR069" H 3700 2350 50  0001 C CNN
F 1 "GND" H 3705 2427 50  0000 C CNN
F 2 "" H 3700 2600 50  0001 C CNN
F 3 "" H 3700 2600 50  0001 C CNN
	1    3700 2600
	1    0    0    -1  
$EndComp
NoConn ~ 3450 2450
Wire Wire Line
	3350 2450 3450 2450
Text Label 1650 1050 0    50   ~ 0
VCCIO_0
Text Label 1650 1150 0    50   ~ 0
VCCIO_1
Text Label 1650 1250 0    50   ~ 0
VCCIO_2
Text Label 1650 1350 0    50   ~ 0
VCCIO_3
Text Label 1600 1650 0    50   ~ 0
VCCPLL0
Text Label 1600 1950 0    50   ~ 0
VCCPLL1
Text Label 1600 2450 0    50   ~ 0
VCC_SPI
Text Label 3550 1050 2    50   ~ 0
VCC0
Text Label 3550 1150 2    50   ~ 0
VCC1
Text Label 3550 1250 2    50   ~ 0
VCC2
Text Label 3550 1350 2    50   ~ 0
VCC3
$Comp
L Device:C_Small C?
U 1 1 5D7D0814
P 2350 3050
AR Path="/5D7C5399/5D7D0814" Ref="C?"  Part="1" 
AR Path="/5D74F1A4/5D7D0814" Ref="C?"  Part="1" 
AR Path="/5E9AF0AF/5D7D0814" Ref="C?"  Part="1" 
AR Path="/5E9AF0BC/5D7D0814" Ref="C?"  Part="1" 
AR Path="/5FC264E9/5D7D0814" Ref="C?"  Part="1" 
AR Path="/5FFA49FD/5D7D0814" Ref="C?"  Part="1" 
AR Path="/60023325/60024B6C/5D7D0814" Ref="C25"  Part="1" 
F 0 "C25" V 2121 3050 50  0000 C CNN
F 1 "0.1u" V 2212 3050 50  0000 C CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 2350 3050 50  0001 C CNN
F 3 "~" H 2350 3050 50  0001 C CNN
	1    2350 3050
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D7D23A5
P 2350 3450
AR Path="/5D7C5399/5D7D23A5" Ref="C?"  Part="1" 
AR Path="/5D74F1A4/5D7D23A5" Ref="C?"  Part="1" 
AR Path="/5E9AF0AF/5D7D23A5" Ref="C?"  Part="1" 
AR Path="/5E9AF0BC/5D7D23A5" Ref="C?"  Part="1" 
AR Path="/5FC264E9/5D7D23A5" Ref="C?"  Part="1" 
AR Path="/5FFA49FD/5D7D23A5" Ref="C?"  Part="1" 
AR Path="/60023325/60024B6C/5D7D23A5" Ref="C28"  Part="1" 
F 0 "C28" V 2121 3450 50  0000 C CNN
F 1 "0.1u" V 2212 3450 50  0000 C CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 2350 3450 50  0001 C CNN
F 3 "~" H 2350 3450 50  0001 C CNN
	1    2350 3450
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D7D2D83
P 2350 3850
AR Path="/5D7C5399/5D7D2D83" Ref="C?"  Part="1" 
AR Path="/5D74F1A4/5D7D2D83" Ref="C?"  Part="1" 
AR Path="/5E9AF0AF/5D7D2D83" Ref="C?"  Part="1" 
AR Path="/5E9AF0BC/5D7D2D83" Ref="C?"  Part="1" 
AR Path="/5FC264E9/5D7D2D83" Ref="C?"  Part="1" 
AR Path="/5FFA49FD/5D7D2D83" Ref="C?"  Part="1" 
AR Path="/60023325/60024B6C/5D7D2D83" Ref="C30"  Part="1" 
F 0 "C30" V 2121 3850 50  0000 C CNN
F 1 "0.1u" V 2212 3850 50  0000 C CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 2350 3850 50  0001 C CNN
F 3 "~" H 2350 3850 50  0001 C CNN
	1    2350 3850
	0    1    1    0   
$EndComp
Text Label 1850 3450 0    50   ~ 0
VCCIO_1
Text Label 1850 3850 0    50   ~ 0
VCCIO_2
Text Label 1850 4250 0    50   ~ 0
VCCIO_3
Text Label 1850 3050 0    50   ~ 0
VCCIO_0
Wire Wire Line
	1850 3050 2250 3050
Wire Wire Line
	2250 3450 1850 3450
Wire Wire Line
	2250 3850 1850 3850
Wire Wire Line
	2250 4250 1850 4250
$Comp
L Device:C_Small C?
U 1 1 5D7EF316
P 3300 2850
AR Path="/5D7C5399/5D7EF316" Ref="C?"  Part="1" 
AR Path="/5D74F1A4/5D7EF316" Ref="C?"  Part="1" 
AR Path="/5E9AF0AF/5D7EF316" Ref="C?"  Part="1" 
AR Path="/5E9AF0BC/5D7EF316" Ref="C?"  Part="1" 
AR Path="/5FC264E9/5D7EF316" Ref="C?"  Part="1" 
AR Path="/5FFA49FD/5D7EF316" Ref="C?"  Part="1" 
AR Path="/60023325/60024B6C/5D7EF316" Ref="C23"  Part="1" 
F 0 "C23" V 3071 2850 50  0000 C CNN
F 1 "0.1u" V 3162 2850 50  0000 C CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 3300 2850 50  0001 C CNN
F 3 "~" H 3300 2850 50  0001 C CNN
	1    3300 2850
	0    1    1    0   
$EndComp
Text Label 2800 2850 0    50   ~ 0
VCC_SPI
Wire Wire Line
	3200 2850 2800 2850
Wire Wire Line
	2450 3050 2550 3050
Wire Wire Line
	2550 3050 2550 3450
Wire Wire Line
	3400 2850 3500 2850
Wire Wire Line
	2450 4250 2550 4250
Wire Wire Line
	2450 3850 2550 3850
Connection ~ 2550 3850
Wire Wire Line
	2550 3850 2550 4250
Wire Wire Line
	2450 3450 2550 3450
Connection ~ 2550 3450
Wire Wire Line
	2550 3450 2550 3850
Wire Wire Line
	1550 3450 1550 3850
Connection ~ 1550 3450
Wire Wire Line
	1450 3450 1550 3450
Wire Wire Line
	1550 3850 1550 4250
Connection ~ 1550 3850
Wire Wire Line
	1450 3850 1550 3850
Wire Wire Line
	1450 4250 1550 4250
Wire Wire Line
	1550 3050 1550 3450
Wire Wire Line
	1450 3050 1550 3050
Text Label 1000 4250 0    50   ~ 0
VCC3
$Comp
L Device:C_Small C?
U 1 1 5D7ECCCB
P 1350 4250
AR Path="/5D7C5399/5D7ECCCB" Ref="C?"  Part="1" 
AR Path="/5D74F1A4/5D7ECCCB" Ref="C?"  Part="1" 
AR Path="/5E9AF0AF/5D7ECCCB" Ref="C?"  Part="1" 
AR Path="/5E9AF0BC/5D7ECCCB" Ref="C?"  Part="1" 
AR Path="/5FC264E9/5D7ECCCB" Ref="C?"  Part="1" 
AR Path="/5FFA49FD/5D7ECCCB" Ref="C?"  Part="1" 
AR Path="/60023325/60024B6C/5D7ECCCB" Ref="C33"  Part="1" 
F 0 "C33" V 1121 4250 50  0000 C CNN
F 1 "0.1u" V 1212 4250 50  0000 C CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 1350 4250 50  0001 C CNN
F 3 "~" H 1350 4250 50  0001 C CNN
	1    1350 4250
	0    1    1    0   
$EndComp
Wire Wire Line
	1000 3850 1250 3850
Text Label 1000 3850 0    50   ~ 0
VCC2
$Comp
L Device:C_Small C?
U 1 1 5D7ECCC3
P 1350 3850
AR Path="/5D7C5399/5D7ECCC3" Ref="C?"  Part="1" 
AR Path="/5D74F1A4/5D7ECCC3" Ref="C?"  Part="1" 
AR Path="/5E9AF0AF/5D7ECCC3" Ref="C?"  Part="1" 
AR Path="/5E9AF0BC/5D7ECCC3" Ref="C?"  Part="1" 
AR Path="/5FC264E9/5D7ECCC3" Ref="C?"  Part="1" 
AR Path="/5FFA49FD/5D7ECCC3" Ref="C?"  Part="1" 
AR Path="/60023325/60024B6C/5D7ECCC3" Ref="C29"  Part="1" 
F 0 "C29" V 1121 3850 50  0000 C CNN
F 1 "0.1u" V 1212 3850 50  0000 C CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 1350 3850 50  0001 C CNN
F 3 "~" H 1350 3850 50  0001 C CNN
	1    1350 3850
	0    1    1    0   
$EndComp
Text Label 1000 3450 0    50   ~ 0
VCC1
$Comp
L Device:C_Small C?
U 1 1 5D7EA564
P 1350 3450
AR Path="/5D7C5399/5D7EA564" Ref="C?"  Part="1" 
AR Path="/5D74F1A4/5D7EA564" Ref="C?"  Part="1" 
AR Path="/5E9AF0AF/5D7EA564" Ref="C?"  Part="1" 
AR Path="/5E9AF0BC/5D7EA564" Ref="C?"  Part="1" 
AR Path="/5FC264E9/5D7EA564" Ref="C?"  Part="1" 
AR Path="/5FFA49FD/5D7EA564" Ref="C?"  Part="1" 
AR Path="/60023325/60024B6C/5D7EA564" Ref="C27"  Part="1" 
F 0 "C27" V 1121 3450 50  0000 C CNN
F 1 "0.1u" V 1212 3450 50  0000 C CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 1350 3450 50  0001 C CNN
F 3 "~" H 1350 3450 50  0001 C CNN
	1    1350 3450
	0    1    1    0   
$EndComp
Text Label 1000 3050 0    50   ~ 0
VCC0
$Comp
L Device:C_Small C?
U 1 1 5D7E49AB
P 1350 3050
AR Path="/5D7C5399/5D7E49AB" Ref="C?"  Part="1" 
AR Path="/5D74F1A4/5D7E49AB" Ref="C?"  Part="1" 
AR Path="/5E9AF0AF/5D7E49AB" Ref="C?"  Part="1" 
AR Path="/5E9AF0BC/5D7E49AB" Ref="C?"  Part="1" 
AR Path="/5FC264E9/5D7E49AB" Ref="C?"  Part="1" 
AR Path="/5FFA49FD/5D7E49AB" Ref="C?"  Part="1" 
AR Path="/60023325/60024B6C/5D7E49AB" Ref="C24"  Part="1" 
F 0 "C24" V 1121 3050 50  0000 C CNN
F 1 "0.1u" V 1212 3050 50  0000 C CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 1350 3050 50  0001 C CNN
F 3 "~" H 1350 3050 50  0001 C CNN
	1    1350 3050
	0    1    1    0   
$EndComp
Wire Wire Line
	1950 1450 1600 1450
Wire Wire Line
	1600 1450 1600 1350
Connection ~ 1600 1350
Wire Wire Line
	1600 1350 1450 1350
Text Label 1900 2250 2    50   ~ 0
VPP_2V5
Wire Wire Line
	1450 1350 1450 2450
$Comp
L Device:R_Small_US R?
U 1 1 5D80744D
P 1200 1650
AR Path="/5D74F1A4/5D80744D" Ref="R?"  Part="1" 
AR Path="/5D7C5399/5D80744D" Ref="R?"  Part="1" 
AR Path="/5E9AF0AF/5D80744D" Ref="R?"  Part="1" 
AR Path="/5E9AF0BC/5D80744D" Ref="R?"  Part="1" 
AR Path="/5FC264E9/5D80744D" Ref="R?"  Part="1" 
AR Path="/5FFA49FD/5D80744D" Ref="R?"  Part="1" 
AR Path="/60023325/60024B6C/5D80744D" Ref="R15"  Part="1" 
F 0 "R15" V 995 1650 50  0000 C CNN
F 1 "100R" V 1086 1650 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 1200 1650 50  0001 C CNN
F 3 "~" H 1200 1650 50  0001 C CNN
	1    1200 1650
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small_US R?
U 1 1 5D80825F
P 1200 1950
AR Path="/5D74F1A4/5D80825F" Ref="R?"  Part="1" 
AR Path="/5D7C5399/5D80825F" Ref="R?"  Part="1" 
AR Path="/5E9AF0AF/5D80825F" Ref="R?"  Part="1" 
AR Path="/5E9AF0BC/5D80825F" Ref="R?"  Part="1" 
AR Path="/5FC264E9/5D80825F" Ref="R?"  Part="1" 
AR Path="/5FFA49FD/5D80825F" Ref="R?"  Part="1" 
AR Path="/60023325/60024B6C/5D80825F" Ref="R16"  Part="1" 
F 0 "R16" V 995 1950 50  0000 C CNN
F 1 "100R" V 1086 1950 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 1200 1950 50  0001 C CNN
F 3 "~" H 1200 1950 50  0001 C CNN
	1    1200 1950
	0    1    1    0   
$EndComp
Wire Wire Line
	1000 1950 1100 1950
Connection ~ 1000 1650
Wire Wire Line
	1000 1650 1000 1950
Wire Wire Line
	1300 1650 1950 1650
Wire Wire Line
	1300 1950 1950 1950
Wire Wire Line
	1950 1750 1600 1750
Text Label 1600 1750 0    50   ~ 0
GNDPLL0
Wire Wire Line
	1950 2050 1600 2050
Text Label 1600 2050 0    50   ~ 0
GNDPLL1
$Comp
L Device:C_Small C?
U 1 1 5D88CB86
P 3200 3850
AR Path="/5D74F1A4/5D88CB86" Ref="C?"  Part="1" 
AR Path="/5D7C5399/5D88CB86" Ref="C?"  Part="1" 
AR Path="/5E9AF0AF/5D88CB86" Ref="C?"  Part="1" 
AR Path="/5E9AF0BC/5D88CB86" Ref="C?"  Part="1" 
AR Path="/5FC264E9/5D88CB86" Ref="C?"  Part="1" 
AR Path="/5FFA49FD/5D88CB86" Ref="C?"  Part="1" 
AR Path="/60023325/60024B6C/5D88CB86" Ref="C31"  Part="1" 
F 0 "C31" H 3292 3896 50  0000 L CNN
F 1 "10u" H 3292 3805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3200 3850 50  0001 C CNN
F 3 "~" H 3200 3850 50  0001 C CNN
	1    3200 3850
	1    0    0    -1  
$EndComp
Text Label 2750 4000 0    50   ~ 0
GNDPLL0
Text Label 2750 3700 0    50   ~ 0
VCCPLL0
Wire Wire Line
	2750 3700 3200 3700
Wire Wire Line
	3600 3700 3600 3750
Wire Wire Line
	3200 3750 3200 3700
Connection ~ 3200 3700
Wire Wire Line
	3600 3950 3600 4000
Wire Wire Line
	3200 3950 3200 4000
Connection ~ 3200 4000
Wire Wire Line
	3200 4000 2750 4000
$Comp
L Device:C_Small C?
U 1 1 5EDE65D1
P 3600 4450
AR Path="/5D74F1A4/5EDE65D1" Ref="C?"  Part="1" 
AR Path="/5D7C5399/5EDE65D1" Ref="C?"  Part="1" 
AR Path="/5E9AF0AF/5EDE65D1" Ref="C?"  Part="1" 
AR Path="/5E9AF0BC/5EDE65D1" Ref="C?"  Part="1" 
AR Path="/5FC264E9/5EDE65D1" Ref="C?"  Part="1" 
AR Path="/5FFA49FD/5EDE65D1" Ref="C?"  Part="1" 
AR Path="/60023325/60024B6C/5EDE65D1" Ref="C36"  Part="1" 
F 0 "C36" H 3692 4496 50  0000 L CNN
F 1 "0.1u" H 3692 4405 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 3600 4450 50  0001 C CNN
F 3 "~" H 3600 4450 50  0001 C CNN
	1    3600 4450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5EDE65DB
P 3200 4450
AR Path="/5D74F1A4/5EDE65DB" Ref="C?"  Part="1" 
AR Path="/5D7C5399/5EDE65DB" Ref="C?"  Part="1" 
AR Path="/5E9AF0AF/5EDE65DB" Ref="C?"  Part="1" 
AR Path="/5E9AF0BC/5EDE65DB" Ref="C?"  Part="1" 
AR Path="/5FC264E9/5EDE65DB" Ref="C?"  Part="1" 
AR Path="/5FFA49FD/5EDE65DB" Ref="C?"  Part="1" 
AR Path="/60023325/60024B6C/5EDE65DB" Ref="C35"  Part="1" 
F 0 "C35" H 3292 4496 50  0000 L CNN
F 1 "10u" H 3292 4405 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3200 4450 50  0001 C CNN
F 3 "~" H 3200 4450 50  0001 C CNN
	1    3200 4450
	1    0    0    -1  
$EndComp
Text Label 2750 4300 0    50   ~ 0
VCCPLL1
Wire Wire Line
	2750 4300 3200 4300
Wire Wire Line
	3600 4300 3600 4350
Wire Wire Line
	3200 4350 3200 4300
Connection ~ 3200 4300
Wire Wire Line
	3600 4550 3600 4600
Wire Wire Line
	3200 4550 3200 4600
Connection ~ 3200 4600
Wire Wire Line
	3200 4600 2750 4600
Text Label 2750 4600 0    50   ~ 0
GNDPLL1
$Comp
L Device:C_Small C?
U 1 1 5D88C47D
P 3600 3850
AR Path="/5D74F1A4/5D88C47D" Ref="C?"  Part="1" 
AR Path="/5D7C5399/5D88C47D" Ref="C?"  Part="1" 
AR Path="/5E9AF0AF/5D88C47D" Ref="C?"  Part="1" 
AR Path="/5E9AF0BC/5D88C47D" Ref="C?"  Part="1" 
AR Path="/5FC264E9/5D88C47D" Ref="C?"  Part="1" 
AR Path="/5FFA49FD/5D88C47D" Ref="C?"  Part="1" 
AR Path="/60023325/60024B6C/5D88C47D" Ref="C32"  Part="1" 
F 0 "C32" H 3692 3896 50  0000 L CNN
F 1 "0.1u" H 3692 3805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 3600 3850 50  0001 C CNN
F 3 "~" H 3600 3850 50  0001 C CNN
	1    3600 3850
	1    0    0    -1  
$EndComp
Text HLabel 10050 3850 2    50   Output ~ 0
SDO1
Wire Wire Line
	3600 4000 3200 4000
Wire Wire Line
	3200 4300 3600 4300
Wire Wire Line
	3600 4600 3200 4600
Wire Wire Line
	1000 3450 1250 3450
Wire Wire Line
	3200 3700 3600 3700
Wire Wire Line
	1000 3050 1250 3050
Wire Wire Line
	1000 4250 1250 4250
$Comp
L Device:C_Small C?
U 1 1 5D7D31FC
P 2350 4250
AR Path="/5D7C5399/5D7D31FC" Ref="C?"  Part="1" 
AR Path="/5D74F1A4/5D7D31FC" Ref="C?"  Part="1" 
AR Path="/5E9AF0AF/5D7D31FC" Ref="C?"  Part="1" 
AR Path="/5E9AF0BC/5D7D31FC" Ref="C?"  Part="1" 
AR Path="/5FC264E9/5D7D31FC" Ref="C?"  Part="1" 
AR Path="/5FFA49FD/5D7D31FC" Ref="C?"  Part="1" 
AR Path="/60023325/60024B6C/5D7D31FC" Ref="C34"  Part="1" 
F 0 "C34" V 2121 4250 50  0000 C CNN
F 1 "0.1u" V 2212 4250 50  0000 C CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 2350 4250 50  0001 C CNN
F 3 "~" H 2350 4250 50  0001 C CNN
	1    2350 4250
	0    1    1    0   
$EndComp
Text HLabel 7850 3000 0    50   Input ~ 0
~READY_IN
NoConn ~ 4650 1100
NoConn ~ 4650 1200
NoConn ~ 4650 1300
NoConn ~ 4650 1400
NoConn ~ 4650 1500
NoConn ~ 4650 1600
NoConn ~ 4650 1700
NoConn ~ 4650 1800
NoConn ~ 4650 1900
NoConn ~ 4650 2000
NoConn ~ 4650 2100
NoConn ~ 6850 1900
NoConn ~ 6850 1800
NoConn ~ 6850 1700
NoConn ~ 6850 1600
NoConn ~ 6850 1500
NoConn ~ 6850 1400
NoConn ~ 6850 1300
NoConn ~ 6850 1200
NoConn ~ 6850 1100
NoConn ~ 6850 1000
NoConn ~ 10050 1050
NoConn ~ 10050 1150
NoConn ~ 10050 1250
NoConn ~ 10050 1350
NoConn ~ 10050 1450
NoConn ~ 10050 1550
NoConn ~ 10050 1650
NoConn ~ 10050 1750
NoConn ~ 7850 2050
NoConn ~ 7850 1750
NoConn ~ 7850 1650
NoConn ~ 7850 1550
NoConn ~ 7850 1450
NoConn ~ 7850 1350
NoConn ~ 7850 1250
NoConn ~ 7850 1150
NoConn ~ 7850 1050
NoConn ~ 10050 4050
NoConn ~ 10050 3950
NoConn ~ 10050 3650
NoConn ~ 10050 3450
NoConn ~ 10050 3350
Text HLabel 10050 3050 2    50   Input ~ 0
SDI1
$Comp
L power:GND #PWR?
U 1 1 5FCD635C
P 2550 4500
AR Path="/5D7C5399/5FCD635C" Ref="#PWR?"  Part="1" 
AR Path="/5D74F1A4/5FCD635C" Ref="#PWR?"  Part="1" 
AR Path="/5E9AF0AF/5FCD635C" Ref="#PWR?"  Part="1" 
AR Path="/5E9AF0BC/5FCD635C" Ref="#PWR?"  Part="1" 
AR Path="/5FC264E9/5FCD635C" Ref="#PWR?"  Part="1" 
AR Path="/5FFA49FD/5FCD635C" Ref="#PWR?"  Part="1" 
AR Path="/60023325/60024B6C/5FCD635C" Ref="#PWR072"  Part="1" 
F 0 "#PWR072" H 2550 4250 50  0001 C CNN
F 1 "GND" H 2555 4327 50  0000 C CNN
F 2 "" H 2550 4500 50  0001 C CNN
F 3 "" H 2550 4500 50  0001 C CNN
	1    2550 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 4250 2550 4500
Connection ~ 2550 4250
$Comp
L power:GND #PWR?
U 1 1 5FCDA69E
P 1550 4500
AR Path="/5D7C5399/5FCDA69E" Ref="#PWR?"  Part="1" 
AR Path="/5D74F1A4/5FCDA69E" Ref="#PWR?"  Part="1" 
AR Path="/5E9AF0AF/5FCDA69E" Ref="#PWR?"  Part="1" 
AR Path="/5E9AF0BC/5FCDA69E" Ref="#PWR?"  Part="1" 
AR Path="/5FC264E9/5FCDA69E" Ref="#PWR?"  Part="1" 
AR Path="/5FFA49FD/5FCDA69E" Ref="#PWR?"  Part="1" 
AR Path="/60023325/60024B6C/5FCDA69E" Ref="#PWR071"  Part="1" 
F 0 "#PWR071" H 1550 4250 50  0001 C CNN
F 1 "GND" H 1555 4327 50  0000 C CNN
F 2 "" H 1550 4500 50  0001 C CNN
F 3 "" H 1550 4500 50  0001 C CNN
	1    1550 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 4250 1550 4500
Connection ~ 1550 4250
Wire Notes Line
	4100 600  600  600 
Wire Notes Line
	4200 600  10650 600 
Wire Notes Line
	10650 600  10650 5350
Wire Notes Line
	10650 5350 4200 5350
Wire Notes Line
	4200 600  4200 5350
NoConn ~ 6850 3450
NoConn ~ 6850 3650
NoConn ~ 6850 3750
$Comp
L jkiv-lattice:iCE40HX8K-BG121(121-Ball_caBGA) U?
U 3 1 5D753833
P 5750 3800
AR Path="/5D7C5399/5D753833" Ref="U?"  Part="3" 
AR Path="/5D74F1A4/5D753833" Ref="U?"  Part="3" 
AR Path="/5E9AF0AF/5D753833" Ref="U?"  Part="3" 
AR Path="/5E9AF0BC/5D753833" Ref="U?"  Part="3" 
AR Path="/5FC264E9/5D753833" Ref="U?"  Part="3" 
AR Path="/5FFA49FD/5D753833" Ref="U?"  Part="3" 
AR Path="/60023325/60024B6C/5D753833" Ref="U8"  Part="3" 
F 0 "U8" H 5750 4837 60  0000 C CNN
F 1 "iCE40HX8K-BG121(121-Ball_caBGA)" H 5750 4731 60  0000 C CNN
F 2 "jkiv-library:BGA-121_11x11_9.0x9.0mm" H 5750 3300 60  0001 C CNN
F 3 "" H 5750 3300 60  0000 C CNN
	3    5750 3800
	1    0    0    -1  
$EndComp
NoConn ~ 7850 4200
NoConn ~ 4650 3050
NoConn ~ 4650 3550
NoConn ~ 4650 3450
NoConn ~ 4650 3350
NoConn ~ 4650 3950
NoConn ~ 4650 3850
NoConn ~ 4650 3750
NoConn ~ 4650 3650
NoConn ~ 4650 3250
NoConn ~ 4650 3150
NoConn ~ 6850 3850
NoConn ~ 6850 3550
NoConn ~ 6850 3350
NoConn ~ 6850 3250
NoConn ~ 7850 4400
NoConn ~ 7850 4300
NoConn ~ 7850 4100
NoConn ~ 7850 4000
NoConn ~ 7850 3900
NoConn ~ 7850 3800
NoConn ~ 7850 3700
NoConn ~ 7850 3600
NoConn ~ 7850 3500
NoConn ~ 7850 3400
NoConn ~ 7850 3300
NoConn ~ 7850 3200
Text Notes 7000 4750 0    50   ~ 0
~CS0~ = 0 by default: SPI slave mode
Text HLabel 6850 4350 2    50   Input ~ 0
SCK0
Text HLabel 6850 4250 2    50   Input ~ 0
SDI0
Text HLabel 6850 4150 2    50   Output ~ 0
SDO0
Text HLabel 6850 4050 2    50   Input ~ 0
CRESET_B
$Comp
L jkiv-lattice:iCE40HX8K-BG121(121-Ball_caBGA) U?
U 4 1 5D75A968
P 8950 3750
AR Path="/5D7C5399/5D75A968" Ref="U?"  Part="4" 
AR Path="/5D74F1A4/5D75A968" Ref="U?"  Part="4" 
AR Path="/5E9AF0AF/5D75A968" Ref="U?"  Part="4" 
AR Path="/5E9AF0BC/5D75A968" Ref="U?"  Part="4" 
AR Path="/5FC264E9/5D75A968" Ref="U?"  Part="4" 
AR Path="/5FFA49FD/5D75A968" Ref="U?"  Part="4" 
AR Path="/60023325/60024B6C/5D75A968" Ref="U8"  Part="4" 
F 0 "U8" H 8950 4787 60  0000 C CNN
F 1 "iCE40HX8K-BG121(121-Ball_caBGA)" H 8950 4681 60  0000 C CNN
F 2 "jkiv-library:BGA-121_11x11_9.0x9.0mm" H 8950 3250 60  0001 C CNN
F 3 "" H 8950 3250 60  0000 C CNN
	4    8950 3750
	1    0    0    -1  
$EndComp
Text HLabel 6850 3950 2    50   Output ~ 0
CDONE
Text Notes 3750 6150 0    50   ~ 0
Power
Text Notes 10450 5300 0    50   ~ 0
I/O
$Comp
L Device:C_Small C?
U 1 1 5EA9A3F9
P 3300 3250
AR Path="/5D7C5399/5EA9A3F9" Ref="C?"  Part="1" 
AR Path="/5D74F1A4/5EA9A3F9" Ref="C?"  Part="1" 
AR Path="/5E9AF0AF/5EA9A3F9" Ref="C?"  Part="1" 
AR Path="/5E9AF0BC/5EA9A3F9" Ref="C?"  Part="1" 
AR Path="/5FC264E9/5EA9A3F9" Ref="C?"  Part="1" 
AR Path="/5FFA49FD/5EA9A3F9" Ref="C?"  Part="1" 
AR Path="/60023325/60024B6C/5EA9A3F9" Ref="C26"  Part="1" 
F 0 "C26" V 3071 3250 50  0000 C CNN
F 1 "0.1u" V 3162 3250 50  0000 C CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 3300 3250 50  0001 C CNN
F 3 "~" H 3300 3250 50  0001 C CNN
	1    3300 3250
	0    1    1    0   
$EndComp
Text Label 2800 3250 0    50   ~ 0
VPP_2V5
Wire Wire Line
	3200 3250 2800 3250
$Comp
L power:GND #PWR?
U 1 1 5D8109A2
P 3500 3450
AR Path="/5D7C5399/5D8109A2" Ref="#PWR?"  Part="1" 
AR Path="/5D74F1A4/5D8109A2" Ref="#PWR?"  Part="1" 
AR Path="/5E9AF0AF/5D8109A2" Ref="#PWR?"  Part="1" 
AR Path="/5E9AF0BC/5D8109A2" Ref="#PWR?"  Part="1" 
AR Path="/5FC264E9/5D8109A2" Ref="#PWR?"  Part="1" 
AR Path="/5FFA49FD/5D8109A2" Ref="#PWR?"  Part="1" 
AR Path="/60023325/60024B6C/5D8109A2" Ref="#PWR070"  Part="1" 
F 0 "#PWR070" H 3500 3200 50  0001 C CNN
F 1 "GND" H 3505 3277 50  0000 C CNN
F 2 "" H 3500 3450 50  0001 C CNN
F 3 "" H 3500 3450 50  0001 C CNN
	1    3500 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 2850 3500 3250
Wire Wire Line
	3400 3250 3500 3250
Connection ~ 3500 3250
Wire Wire Line
	3500 3250 3500 3450
$Comp
L Device:Jumper_NC_Small JP?
U 1 1 5EAB04EF
P 1200 2250
AR Path="/5E9AF0BC/5EAB04EF" Ref="JP?"  Part="1" 
AR Path="/5D74F1A4/5EAB04EF" Ref="JP?"  Part="1" 
AR Path="/5D7C5399/5EAB04EF" Ref="JP?"  Part="1" 
AR Path="/5E9AF0AF/5EAB04EF" Ref="JP?"  Part="1" 
AR Path="/5FC264E9/5EAB04EF" Ref="JP?"  Part="1" 
AR Path="/5FFA49FD/5EAB04EF" Ref="JP?"  Part="1" 
AR Path="/60023325/60024B6C/5EAB04EF" Ref="JP1"  Part="1" 
F 0 "JP1" H 1200 2350 50  0000 C CNN
F 1 "CUT_2V5" H 1200 2371 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_Pad1.0x1.5mm" H 1200 2250 50  0001 C CNN
F 3 "~" H 1200 2250 50  0001 C CNN
	1    1200 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 2250 1950 2250
Wire Notes Line
	4100 6200 600  6200
Wire Notes Line
	6950 4700 6850 4700
Wire Notes Line
	6850 4700 6850 4500
Text HLabel 1300 1050 0    50   Input ~ 0
VCCIO
Wire Wire Line
	1300 1050 1450 1050
Connection ~ 1450 1050
Wire Notes Line
	4100 6200 4100 600 
Wire Notes Line
	600  600  600  6200
Text HLabel 6850 4450 2    50   Input ~ 0
~CS0
Text HLabel 10050 3150 2    50   Input ~ 0
SCK1
Wire Wire Line
	3450 5150 3350 5150
Text HLabel 3450 5150 2    50   Input ~ 0
VCCIO
Wire Wire Line
	3100 5150 3150 5150
Text HLabel 3100 5150 0    50   Input ~ 0
CRESET_B
$Comp
L Device:R_Small_US R?
U 1 1 601591BA
P 3250 5150
AR Path="/5E9AF0BC/601591BA" Ref="R?"  Part="1" 
AR Path="/5D74F1A4/601591BA" Ref="R?"  Part="1" 
AR Path="/5D7C5399/601591BA" Ref="R?"  Part="1" 
AR Path="/5E9AF0AF/601591BA" Ref="R?"  Part="1" 
AR Path="/5FC264E9/601591BA" Ref="R?"  Part="1" 
AR Path="/5FFA49FD/601591BA" Ref="R?"  Part="1" 
AR Path="/60023325/60024B6C/601591BA" Ref="R18"  Part="1" 
F 0 "R18" V 3045 5150 50  0000 C CNN
F 1 "10k" V 3136 5150 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 3250 5150 50  0001 C CNN
F 3 "~" H 3250 5150 50  0001 C CNN
	1    3250 5150
	0    1    1    0   
$EndComp
Wire Wire Line
	1400 5150 1450 5150
Text HLabel 1400 5150 0    50   Input ~ 0
~CS0
$Comp
L Device:R_Small_US R?
U 1 1 60143DB0
P 1550 5150
AR Path="/5E9AF0BC/60143DB0" Ref="R?"  Part="1" 
AR Path="/5D74F1A4/60143DB0" Ref="R?"  Part="1" 
AR Path="/5D7C5399/60143DB0" Ref="R?"  Part="1" 
AR Path="/5E9AF0AF/60143DB0" Ref="R?"  Part="1" 
AR Path="/5FC264E9/60143DB0" Ref="R?"  Part="1" 
AR Path="/5FFA49FD/60143DB0" Ref="R?"  Part="1" 
AR Path="/60023325/60024B6C/60143DB0" Ref="R17"  Part="1" 
F 0 "R17" V 1345 5150 50  0000 C CNN
F 1 "10k" V 1436 5150 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 1550 5150 50  0001 C CNN
F 3 "~" H 1550 5150 50  0001 C CNN
	1    1550 5150
	0    1    1    0   
$EndComp
Wire Wire Line
	3450 5550 3350 5550
Text HLabel 3450 5550 2    50   Input ~ 0
VCCIO
Wire Wire Line
	3100 5550 3150 5550
Text HLabel 3100 5550 0    50   Input ~ 0
~RESET
$Comp
L Device:R_Small_US R?
U 1 1 601964D0
P 3250 5550
AR Path="/5E9AF0BC/601964D0" Ref="R?"  Part="1" 
AR Path="/5D74F1A4/601964D0" Ref="R?"  Part="1" 
AR Path="/5D7C5399/601964D0" Ref="R?"  Part="1" 
AR Path="/5E9AF0AF/601964D0" Ref="R?"  Part="1" 
AR Path="/5FC264E9/601964D0" Ref="R?"  Part="1" 
AR Path="/5FFA49FD/601964D0" Ref="R?"  Part="1" 
AR Path="/60023325/60024B6C/601964D0" Ref="R19"  Part="1" 
F 0 "R19" V 3045 5550 50  0000 C CNN
F 1 "10k" V 3136 5550 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 3250 5550 50  0001 C CNN
F 3 "~" H 3250 5550 50  0001 C CNN
	1    3250 5550
	0    1    1    0   
$EndComp
Wire Wire Line
	3450 5950 3350 5950
Text HLabel 3450 5950 2    50   Input ~ 0
VCCIO
Wire Wire Line
	3100 5950 3150 5950
Text HLabel 3100 5950 0    50   Input ~ 0
CDONE
$Comp
L Device:R_Small_US R?
U 1 1 601AC684
P 3250 5950
AR Path="/5E9AF0BC/601AC684" Ref="R?"  Part="1" 
AR Path="/5D74F1A4/601AC684" Ref="R?"  Part="1" 
AR Path="/5D7C5399/601AC684" Ref="R?"  Part="1" 
AR Path="/5E9AF0AF/601AC684" Ref="R?"  Part="1" 
AR Path="/5FC264E9/601AC684" Ref="R?"  Part="1" 
AR Path="/5FFA49FD/601AC684" Ref="R?"  Part="1" 
AR Path="/60023325/60024B6C/601AC684" Ref="R20"  Part="1" 
F 0 "R20" V 3045 5950 50  0000 C CNN
F 1 "10k" V 3136 5950 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 3250 5950 50  0001 C CNN
F 3 "~" H 3250 5950 50  0001 C CNN
	1    3250 5950
	0    1    1    0   
$EndComp
Text HLabel 3750 1050 2    50   Input ~ 0
VCORE
Connection ~ 3700 1050
Wire Wire Line
	3750 1050 3700 1050
Wire Wire Line
	3350 1050 3700 1050
Wire Wire Line
	3350 1150 3700 1150
Wire Wire Line
	3350 1250 3700 1250
Wire Wire Line
	3350 1350 3700 1350
Wire Wire Line
	3350 1450 3700 1450
Wire Wire Line
	3350 1550 3700 1550
Wire Wire Line
	3350 1650 3700 1650
Wire Wire Line
	3350 1850 3700 1850
Wire Wire Line
	3350 1750 3700 1750
Wire Wire Line
	3350 1950 3700 1950
Wire Wire Line
	3350 2050 3700 2050
Wire Wire Line
	3350 2150 3700 2150
Wire Wire Line
	3350 2250 3700 2250
Wire Wire Line
	3350 2350 3700 2350
$Comp
L jkiv-lattice:iCE40HX8K-BG121(121-Ball_caBGA) U?
U 5 1 5D75D226
P 2650 1800
AR Path="/5D7C5399/5D75D226" Ref="U?"  Part="5" 
AR Path="/5D74F1A4/5D75D226" Ref="U?"  Part="5" 
AR Path="/5E9AF0AF/5D75D226" Ref="U?"  Part="5" 
AR Path="/5E9AF0BC/5D75D226" Ref="U?"  Part="5" 
AR Path="/5FC264E9/5D75D226" Ref="U?"  Part="5" 
AR Path="/5FFA49FD/5D75D226" Ref="U?"  Part="5" 
AR Path="/60023325/60024B6C/5D75D226" Ref="U8"  Part="5" 
F 0 "U8" H 2650 2837 60  0000 C CNN
F 1 "iCE40HX8K-BG121(121-Ball_caBGA)" H 2650 2731 60  0000 C CNN
F 2 "jkiv-library:BGA-121_11x11_9.0x9.0mm" H 2650 1300 60  0001 C CNN
F 3 "" H 2650 1300 60  0000 C CNN
	5    2650 1800
	1    0    0    -1  
$EndComp
Text HLabel 950  1650 0    50   Input ~ 0
VCORE
Wire Wire Line
	1100 1650 1000 1650
Wire Wire Line
	950  1650 1000 1650
NoConn ~ 7850 1950
Text HLabel 10050 1950 2    50   Input ~ 0
CLK
Text HLabel 4650 1000 0    50   Input ~ 0
~LED
Text HLabel 10050 3750 2    50   Input ~ 0
~RESET
Text HLabel 1000 2250 0    50   Input ~ 0
VCCIO
Wire Wire Line
	1000 2250 1100 2250
NoConn ~ 6850 2000
$Comp
L jkiv-lattice:iCE40HX8K-BG121(121-Ball_caBGA) U?
U 1 1 5D74F583
P 5750 1700
AR Path="/5D7C5399/5D74F583" Ref="U?"  Part="1" 
AR Path="/5D74F1A4/5D74F583" Ref="U?"  Part="1" 
AR Path="/5E9AF0AF/5D74F583" Ref="U?"  Part="1" 
AR Path="/5E9AF0BC/5D74F583" Ref="U?"  Part="1" 
AR Path="/5FC264E9/5D74F583" Ref="U?"  Part="1" 
AR Path="/5FFA49FD/5D74F583" Ref="U?"  Part="1" 
AR Path="/60023325/60024B6C/5D74F583" Ref="U8"  Part="1" 
F 0 "U8" H 5750 2687 60  0000 C CNN
F 1 "iCE40HX8K-BG121(121-Ball_caBGA)" H 5750 2581 60  0000 C CNN
F 2 "jkiv-library:BGA-121_11x11_9.0x9.0mm" H 5750 1200 60  0001 C CNN
F 3 "" H 5750 1200 60  0000 C CNN
	1    5750 1700
	1    0    0    -1  
$EndComp
NoConn ~ 10050 3250
Wire Wire Line
	1400 5800 1450 5800
Text HLabel 1400 5800 0    50   Input ~ 0
~CS1
$Comp
L Device:R_Small_US R?
U 1 1 601250B3
P 1550 5800
AR Path="/5E9AF0BC/601250B3" Ref="R?"  Part="1" 
AR Path="/5D74F1A4/601250B3" Ref="R?"  Part="1" 
AR Path="/5D7C5399/601250B3" Ref="R?"  Part="1" 
AR Path="/5E9AF0AF/601250B3" Ref="R?"  Part="1" 
AR Path="/5FC264E9/601250B3" Ref="R?"  Part="1" 
AR Path="/5FFA49FD/601250B3" Ref="R?"  Part="1" 
AR Path="/60023325/60024B6C/601250B3" Ref="R31"  Part="1" 
F 0 "R31" V 1345 5800 50  0000 C CNN
F 1 "10k" V 1436 5800 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 1550 5800 50  0001 C CNN
F 3 "~" H 1550 5800 50  0001 C CNN
	1    1550 5800
	0    1    1    0   
$EndComp
Text HLabel 10050 3550 2    50   Input ~ 0
~CS1
NoConn ~ 6850 3150
Wire Wire Line
	1750 5150 1650 5150
Wire Wire Line
	1750 5800 1650 5800
Text HLabel 1750 5800 2    50   Input ~ 0
VCCIO
NoConn ~ 10050 1850
$Comp
L power:GND #PWR0186
U 1 1 5FF8A0AF
P 1750 5250
F 0 "#PWR0186" H 1750 5000 50  0001 C CNN
F 1 "GND" H 1755 5077 50  0000 C CNN
F 2 "" H 1750 5250 50  0001 C CNN
F 3 "" H 1750 5250 50  0001 C CNN
	1    1750 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 5250 1750 5150
Text HLabel 7850 3100 0    50   Output ~ 0
~READY_OUT
NoConn ~ 7850 1850
NoConn ~ 6850 3050
$EndSCHEMATC
