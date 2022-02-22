EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 8
Title ""
Date "2021-08-15"
Rev "CM4"
Comp "fourside.io"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Graphic:Logo_Open_Hardware_Small OSHW1
U 1 1 606231F2
P 10800 6850
F 0 "OSHW1" H 10800 7125 50  0001 C CNN
F 1 "Logo_Open_Hardware_Small" H 10800 6625 50  0001 C CNN
F 2 "Symbol:OSHW-Symbol_6.7x6mm_Copper" H 10800 6850 50  0001 C CNN
F 3 "~" H 10800 6850 50  0001 C CNN
	1    10800 6850
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x16 J2
U 1 1 6220B8F5
P 2700 3450
F 0 "J2" V 2800 3450 50  0000 L CNN
F 1 "E" V 2800 3350 50  0000 L CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_1x16_P1.27mm_Vertical" H 2700 3450 50  0001 C CNN
F 3 "~" H 2700 3450 50  0001 C CNN
	1    2700 3450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2700 3650 2600 3650
Connection ~ 2600 3650
Wire Wire Line
	2600 3650 2500 3650
Connection ~ 2500 3650
Wire Wire Line
	2500 3650 2400 3650
Connection ~ 2400 3650
Wire Wire Line
	2400 3650 2300 3650
Connection ~ 2300 3650
Wire Wire Line
	2300 3650 2200 3650
Connection ~ 2200 3650
Wire Wire Line
	2200 3650 2100 3650
Connection ~ 2100 3650
Wire Wire Line
	2100 3650 2000 3650
Connection ~ 2000 3650
$Comp
L power:GND #PWR0106
U 1 1 622293D0
P 2000 3700
F 0 "#PWR0106" H 2000 3450 50  0001 C CNN
F 1 "GND" H 2005 3527 50  0000 C CNN
F 2 "" H 2000 3700 50  0001 C CNN
F 3 "" H 2000 3700 50  0001 C CNN
	1    2000 3700
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 621C9422
P 1100 3350
F 0 "#PWR0104" H 1100 3100 50  0001 C CNN
F 1 "GND" H 1105 3177 50  0000 C CNN
F 2 "" H 1100 3350 50  0001 C CNN
F 3 "" H 1100 3350 50  0001 C CNN
	1    1100 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 1350 1600 1350
$Comp
L Connector_Generic:Conn_01x20 J1
U 1 1 620BF7F5
P 1800 2250
F 0 "J1" H 1900 2250 50  0000 L CNN
F 1 "S" H 1900 2150 50  0000 L CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_1x20_P1.27mm_Vertical" H 1800 2250 50  0001 C CNN
F 3 "~" H 1800 2250 50  0001 C CNN
	1    1800 2250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 621D51F5
P 4450 2150
F 0 "#PWR0105" H 4450 1900 50  0001 C CNN
F 1 "GND" H 4455 1977 50  0000 C CNN
F 2 "" H 4450 2150 50  0001 C CNN
F 3 "" H 4450 2150 50  0001 C CNN
	1    4450 2150
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4450 1350 3950 1350
Wire Wire Line
	2000 3700 2000 3650
$Comp
L power:GND #PWR0111
U 1 1 627E818A
P 3650 1050
F 0 "#PWR0111" H 3650 800 50  0001 C CNN
F 1 "GND" H 3655 877 50  0000 C CNN
F 2 "" H 3650 1050 50  0001 C CNN
F 3 "" H 3650 1050 50  0001 C CNN
	1    3650 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 1050 3650 950 
Wire Wire Line
	2900 3650 2900 4100
Wire Wire Line
	3100 3650 3100 4000
Wire Wire Line
	3300 3650 3300 3900
Wire Wire Line
	3500 3650 3500 3800
$Comp
L Connector_Generic:Conn_01x08 J3
U 1 1 621AE7BB
P 3750 1750
F 0 "J3" H 3900 1650 50  0000 C CNN
F 1 "N" H 3900 1750 50  0000 C CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_1x08_P1.27mm_Vertical" H 3750 1750 50  0001 C CNN
F 3 "~" H 3750 1750 50  0001 C CNN
	1    3750 1750
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 62284FB5
P 3000 3700
F 0 "#PWR?" H 3000 3450 50  0001 C CNN
F 1 "GND" H 3005 3527 50  0000 C CNN
F 2 "" H 3000 3700 50  0001 C CNN
F 3 "" H 3000 3700 50  0001 C CNN
	1    3000 3700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3000 3700 3000 3650
$Comp
L power:GND #PWR?
U 1 1 62290C55
P 3200 3700
F 0 "#PWR?" H 3200 3450 50  0001 C CNN
F 1 "GND" H 3205 3527 50  0000 C CNN
F 2 "" H 3200 3700 50  0001 C CNN
F 3 "" H 3200 3700 50  0001 C CNN
	1    3200 3700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3200 3700 3200 3650
$Comp
L power:GND #PWR?
U 1 1 6229BE5C
P 3400 3700
F 0 "#PWR?" H 3400 3450 50  0001 C CNN
F 1 "GND" H 3405 3527 50  0000 C CNN
F 2 "" H 3400 3700 50  0001 C CNN
F 3 "" H 3400 3700 50  0001 C CNN
	1    3400 3700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3400 3700 3400 3650
Wire Wire Line
	2800 3650 2700 3650
Connection ~ 2700 3650
Connection ~ 2700 950 
Wire Wire Line
	2800 950  2700 950 
Connection ~ 2800 950 
Wire Wire Line
	2900 950  2800 950 
Connection ~ 2900 950 
Wire Wire Line
	3000 950  2900 950 
Connection ~ 3000 950 
Wire Wire Line
	3100 950  3000 950 
Connection ~ 3100 950 
Wire Wire Line
	3200 950  3100 950 
Connection ~ 3200 950 
Wire Wire Line
	3300 950  3200 950 
Connection ~ 3300 950 
Wire Wire Line
	3400 950  3300 950 
Connection ~ 3400 950 
Wire Wire Line
	2000 950  2100 950 
Wire Wire Line
	2500 950  2400 950 
Connection ~ 2500 950 
Wire Wire Line
	2700 950  2600 950 
Wire Wire Line
	2600 950  2500 950 
Connection ~ 2600 950 
Wire Wire Line
	3500 950  3650 950 
Wire Wire Line
	3500 950  3400 950 
Connection ~ 3500 950 
$Comp
L Connector_Generic:Conn_01x16 J4
U 1 1 6227A490
P 2800 1150
F 0 "J4" V 2900 1150 50  0000 L CNN
F 1 "W" V 2900 1050 50  0000 L CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_1x16_P1.27mm_Vertical" H 2800 1150 50  0001 C CNN
F 3 "~" H 2800 1150 50  0001 C CNN
	1    2800 1150
	0    1    1    0   
$EndComp
Connection ~ 2100 950 
Wire Wire Line
	2100 950  2200 950 
Connection ~ 2200 950 
Wire Wire Line
	2300 950  2200 950 
Text HLabel 3950 1450 2    50   Output ~ 0
SCK1_OUT
Text HLabel 3950 1650 2    50   Output ~ 0
SDO1
Text HLabel 3950 1850 2    50   Output ~ 0
~CS1_OUT
Text HLabel 3950 2050 2    50   Output ~ 0
~READY_IN
Wire Wire Line
	2900 4100 3750 4100
Wire Wire Line
	3100 4000 3750 4000
Wire Wire Line
	3300 3900 3750 3900
Wire Wire Line
	3500 3800 3750 3800
Text HLabel 3750 4000 2    50   BiDi ~ 0
IO2
Text HLabel 3750 4100 2    50   BiDi ~ 0
IO3
Text HLabel 3750 3900 2    50   BiDi ~ 0
IO1
Text HLabel 3750 3800 2    50   BiDi ~ 0
IO0
Text HLabel 1600 3250 0    50   Input ~ 0
~RESET
Text HLabel 1600 3050 0    50   Input ~ 0
SDI0
Text HLabel 1600 2850 0    50   Input ~ 0
~CS0
Text HLabel 1600 2650 0    50   Input ~ 0
SCK0
Text HLabel 1600 2450 0    50   Input ~ 0
CRESET_B
Text HLabel 1600 2250 0    50   Output ~ 0
CDONE
Text HLabel 1600 2050 0    50   Input ~ 0
~READY_OUT
Text HLabel 1600 1650 0    50   Input ~ 0
SDI1_IN
Text HLabel 1600 1450 0    50   Input ~ 0
SCK1_IN
Text HLabel 1600 1850 0    50   Input ~ 0
~CS1_IN
Wire Wire Line
	1100 1350 1100 1550
Wire Wire Line
	1600 1550 1100 1550
Connection ~ 1100 1550
Wire Wire Line
	1100 1550 1100 1750
Wire Wire Line
	1600 1750 1100 1750
Connection ~ 1100 1750
Wire Wire Line
	1100 1750 1100 1950
Wire Wire Line
	1600 1950 1100 1950
Connection ~ 1100 1950
Wire Wire Line
	1100 1950 1100 2150
Wire Wire Line
	1600 2150 1100 2150
Connection ~ 1100 2150
Wire Wire Line
	1100 2150 1100 2350
Wire Wire Line
	1600 2350 1100 2350
Connection ~ 1100 2350
Wire Wire Line
	1100 2350 1100 2550
Wire Wire Line
	1600 2550 1100 2550
Connection ~ 1100 2550
Wire Wire Line
	1100 2550 1100 2750
Wire Wire Line
	1600 2750 1100 2750
Connection ~ 1100 2750
Wire Wire Line
	1100 2750 1100 2950
Wire Wire Line
	1600 2950 1100 2950
Connection ~ 1100 2950
Wire Wire Line
	1100 2950 1100 3150
Wire Wire Line
	1600 3150 1100 3150
Connection ~ 1100 3150
Wire Wire Line
	1100 3150 1100 3350
Wire Wire Line
	3950 1950 4450 1950
Connection ~ 4450 1950
Wire Wire Line
	4450 1950 4450 2150
Wire Wire Line
	3950 1750 4450 1750
Connection ~ 4450 1750
Wire Wire Line
	4450 1750 4450 1950
Wire Wire Line
	3950 1550 4450 1550
Wire Wire Line
	4450 1350 4450 1550
Connection ~ 4450 1550
Wire Wire Line
	4450 1550 4450 1750
$Comp
L power:+12V #PWR?
U 1 1 621A22E3
P 2000 900
F 0 "#PWR?" H 2000 750 50  0001 C CNN
F 1 "+12V" H 2015 1073 50  0000 C CNN
F 2 "" H 2000 900 50  0001 C CNN
F 3 "" H 2000 900 50  0001 C CNN
	1    2000 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 950  2000 900 
Connection ~ 2000 950 
$EndSCHEMATC
