EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 3 3
Title ""
Date "2021-08-15"
Rev "CM4"
Comp "fourside.io"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 1600 1700 0    50   Input ~ 0
ETH_SH
Text Notes 1000 850  0    50   ~ 0
TODO PoE rectifier and filter ckt
$Comp
L power:GND #PWR0114
U 1 1 613ED1D6
P 2350 1700
F 0 "#PWR0114" H 2350 1450 50  0001 C CNN
F 1 "GND" V 2355 1572 50  0000 R CNN
F 2 "" H 2350 1700 50  0001 C CNN
F 3 "" H 2350 1700 50  0001 C CNN
	1    2350 1700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0115
U 1 1 613F56C9
P 2350 1200
F 0 "#PWR0115" H 2350 1050 50  0001 C CNN
F 1 "+5V" H 2365 1373 50  0000 C CNN
F 2 "" H 2350 1200 50  0001 C CNN
F 3 "" H 2350 1200 50  0001 C CNN
	1    2350 1200
	1    0    0    -1  
$EndComp
Text HLabel 1600 1600 0    50   Input ~ 0
ETH_TAP4
Text HLabel 1600 1300 0    50   Input ~ 0
ETH_TAP1
Text HLabel 1600 1400 0    50   Input ~ 0
ETH_TAP2
Text HLabel 1600 1500 0    50   Input ~ 0
ETH_TAP3
Wire Wire Line
	2300 1200 2350 1200
Wire Wire Line
	2350 1700 2300 1700
$Comp
L jkiv-expansion:Expansion_PoE U2
U 1 1 61A153A8
P 1950 1400
F 0 "U2" H 1950 1865 50  0000 C CNN
F 1 "Expansion_PoE" H 1950 1774 50  0000 C CNN
F 2 "jkiv-library:expansion-poe-P2.0mm_SMD" H 1950 1400 50  0001 C CNN
F 3 "" H 1950 1400 50  0001 C CNN
	1    1950 1400
	1    0    0    -1  
$EndComp
NoConn ~ 1600 1200
$EndSCHEMATC
