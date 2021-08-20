EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 4 6
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
L power:+3V3 #PWR0172
U 1 1 60782BF4
P 9450 5450
F 0 "#PWR0172" H 9450 5300 50  0001 C CNN
F 1 "+3V3" H 9465 5623 50  0000 C CNN
F 2 "" H 9450 5450 50  0001 C CNN
F 3 "" H 9450 5450 50  0001 C CNN
	1    9450 5450
	1    0    0    -1  
$EndComp
Text Notes 8450 4600 0    50   ~ 0
Connect for +5% output voltage
Text Label 8450 5550 0    50   ~ 0
SW_3v3
Text Notes 6900 4950 0    50   ~ 0
5V to 3.3V 3A buck: TPS62132
$Comp
L Regulator_Switching:TPS62133 U?
U 1 1 611DD0CB
P 8050 5750
F 0 "U?" H 8050 6431 50  0000 C CNN
F 1 "TPS62132" H 8050 6340 50  0000 C CNN
F 2 "Package_DFN_QFN:VQFN-16-1EP_3x3mm_P0.5mm_EP1.68x1.68mm_ThermalVias" H 8200 5300 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/tps62130.pdf" H 8050 5750 50  0001 C CNN
	1    8050 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 5250 8150 5200
Wire Wire Line
	7950 5200 7950 5250
Wire Wire Line
	7950 5200 8150 5200
$Comp
L Device:C_Small C?
U 1 1 611DD0E5
P 6950 5350
F 0 "C?" H 7042 5396 50  0000 L CNN
F 1 "10u" H 7042 5305 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric" H 6950 5350 50  0001 C CNN
F 3 "~" H 6950 5350 50  0001 C CNN
	1    6950 5350
	1    0    0    -1  
$EndComp
Text Label 8500 5850 0    50   ~ 0
PG
Text Label 8500 5750 0    50   ~ 0
SENSE
$Comp
L Device:L_Small L?
U 1 1 611DD0FB
P 8850 5550
F 0 "L?" V 9050 5550 50  0000 C CNN
F 1 "2.2u" V 8950 5550 50  0000 C CNN
F 2 "Inductor_SMD:L_Vishay_IHLP-1212" H 8850 5550 50  0001 C CNN
F 3 "IHLP1212BZER2R2M11" H 8850 5550 50  0001 C CNN
F 4 "IHLP1212BZER2R2M11" V 8850 5550 50  0001 C CNN "Part"
	1    8850 5550
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0143
U 1 1 611DD105
P 8050 6350
F 0 "#PWR0143" H 8050 6100 50  0001 C CNN
F 1 "GND" H 8055 6177 50  0000 C CNN
F 2 "" H 8050 6350 50  0001 C CNN
F 3 "" H 8050 6350 50  0001 C CNN
	1    8050 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 6300 7950 6250
Wire Wire Line
	8050 6300 7950 6300
Wire Wire Line
	8050 6350 8050 6300
Wire Wire Line
	8050 6300 8050 6250
Connection ~ 8050 6300
Wire Wire Line
	8150 6300 8150 6250
Wire Wire Line
	8500 6300 8500 5950
Wire Wire Line
	8500 5950 8450 5950
Wire Wire Line
	8050 6300 8150 6300
Wire Wire Line
	8150 6300 8500 6300
Connection ~ 8150 6300
Wire Wire Line
	9000 5550 9000 5750
$Comp
L power:GND #PWR0144
U 1 1 611DD11F
P 9450 5950
F 0 "#PWR0144" H 9450 5700 50  0001 C CNN
F 1 "GND" H 9455 5777 50  0000 C CNN
F 2 "" H 9450 5950 50  0001 C CNN
F 3 "" H 9450 5950 50  0001 C CNN
	1    9450 5950
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R?
U 1 1 611DD133
P 9100 5700
F 0 "R?" H 9168 5746 50  0000 L CNN
F 1 "100k" H 9168 5655 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 9100 5700 50  0001 C CNN
F 3 "~" H 9100 5700 50  0001 C CNN
	1    9100 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	9100 5850 9100 5800
Wire Wire Line
	8450 5850 9100 5850
Wire Wire Line
	9100 5600 9100 5550
Wire Wire Line
	9450 5600 9450 5550
Wire Wire Line
	6950 5250 6950 5200
Wire Wire Line
	6950 5500 6950 5450
Text Label 7650 5750 2    50   ~ 0
DEF
Text Label 7650 5850 2    50   ~ 0
FSW
Wire Wire Line
	7050 5950 7050 5900
$Comp
L power:GND #PWR0145
U 1 1 611DD15B
P 7050 6000
F 0 "#PWR0145" H 7050 5750 50  0001 C CNN
F 1 "GND" H 7055 5827 50  0000 C CNN
F 2 "" H 7050 6000 50  0001 C CNN
F 3 "" H 7050 6000 50  0001 C CNN
	1    7050 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 5700 7050 5650
$Comp
L Device:C_Small C?
U 1 1 611DD166
P 7050 5800
F 0 "C?" H 7142 5846 50  0000 L CNN
F 1 "3.3u" H 7142 5755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7050 5800 50  0001 C CNN
F 3 "~" H 7050 5800 50  0001 C CNN
	1    7050 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 5550 9450 5450
Connection ~ 9450 5550
$Comp
L Device:C_Small C?
U 1 1 611DD188
P 7300 5350
F 0 "C?" H 7392 5396 50  0000 L CNN
F 1 "0.1u" H 7392 5305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7300 5350 50  0001 C CNN
F 3 "~" H 7300 5350 50  0001 C CNN
	1    7300 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 5250 7300 5200
Wire Wire Line
	6950 5200 7300 5200
Wire Wire Line
	6950 5500 7300 5500
Wire Wire Line
	7300 5450 7300 5500
$Comp
L Device:Jumper_NO_Small JP?
U 1 1 62389140
P 8050 4400
F 0 "JP?" H 8050 4585 50  0000 C CNN
F 1 "FSW" H 8050 4494 50  0000 C CNN
F 2 "jkiv-library:J_NO_0201_0603Metric" H 8050 4400 50  0001 C CNN
F 3 "~" H 8050 4400 50  0001 C CNN
	1    8050 4400
	1    0    0    -1  
$EndComp
Text Label 8150 4400 0    50   ~ 0
FSW
Text Label 7950 4400 2    50   ~ 0
PG
Text Notes 8450 4400 0    50   ~ 0
Connect for lower-frequency,\nhigher-efficiency operation.
Text Label 8150 4700 0    50   ~ 0
DEF
$Comp
L Device:Jumper_NO_Small JP?
U 1 1 62389528
P 8050 4700
F 0 "JP?" H 8050 4885 50  0000 C CNN
F 1 "DEF" H 8050 4794 50  0000 C CNN
F 2 "jkiv-library:J_NO_0201_0603Metric" H 8050 4700 50  0001 C CNN
F 3 "~" H 8050 4700 50  0001 C CNN
	1    8050 4700
	1    0    0    -1  
$EndComp
Text HLabel 7650 5550 0    50   Input ~ 0
FPGA_PEN
Wire Wire Line
	8950 5550 9000 5550
Wire Wire Line
	8450 5550 8750 5550
Wire Wire Line
	8450 5750 9000 5750
Wire Wire Line
	7050 5650 7650 5650
Wire Wire Line
	7300 5200 7950 5200
Connection ~ 7300 5200
Connection ~ 7950 5200
Connection ~ 7650 5650
Wire Wire Line
	7650 5650 7700 5650
Wire Wire Line
	7650 5850 7350 5850
Wire Wire Line
	7650 5750 7350 5750
Wire Wire Line
	7050 5950 6950 5950
Wire Wire Line
	6950 5950 6950 5500
Connection ~ 7050 5950
Connection ~ 6950 5500
Wire Wire Line
	7050 6000 7050 5950
Text Notes 6850 6450 0    50   ~ 0
10u between PVIN-PGND\n0.1u between AVIN-AGND
Text Notes 8550 6150 0    50   ~ 0
FB to AGND
Text HLabel 1300 1550 0    50   Input ~ 0
ETH_V+
Text HLabel 1300 2300 0    50   Input ~ 0
ETH_V-
Text HLabel 4100 5600 0    50   BiDi ~ 0
USB_SBU1
Text HLabel 4100 5700 0    50   BiDi ~ 0
USB_SBU2
Text HLabel 4100 5500 0    50   BiDi ~ 0
USB_CC2
Text HLabel 4100 5400 0    50   BiDi ~ 0
USB_CC1
Text Notes 3500 5900 0    50   ~ 0
TODO USB PD 5V @ 3A
Wire Wire Line
	9100 5550 9450 5550
Wire Wire Line
	9000 5550 9100 5550
Connection ~ 9000 5550
Connection ~ 9100 5550
$Comp
L Device:D_Small D?
U 1 1 61294A3C
P 1750 1900
F 0 "D?" V 1613 1970 50  0000 L CNN
F 1 "TVS" V 1704 1970 50  0000 L CNN
F 2 "" V 1750 1900 50  0001 C CNN
F 3 "~" V 1750 1900 50  0001 C CNN
F 4 "55V" V 1795 1970 50  0000 L CNN "Voltage"
F 5 "SMAJ58A" V 1886 1970 50  0000 L CNN "Part"
	1    1750 1900
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C?
U 1 1 61297279
P 1400 1900
F 0 "C?" H 1492 1991 50  0000 L CNN
F 1 "0.1u" H 1492 1900 50  0000 L CNN
F 2 "" H 1400 1900 50  0001 C CNN
F 3 "~" H 1400 1900 50  0001 C CNN
F 4 "100V" H 1492 1809 50  0000 L CNN "Rating"
	1    1400 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R?
U 1 1 6129838F
P 2000 1650
F 0 "R?" H 2050 1700 50  0000 L CNN
F 1 "25.5k" H 2050 1600 50  0000 L CNN
F 2 "" H 2000 1650 50  0001 C CNN
F 3 "~" H 2000 1650 50  0001 C CNN
F 4 "1%" H 1850 1700 50  0000 L CNN "Tolerance"
	1    2000 1650
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R?
U 1 1 6129CB89
P 2000 2200
F 0 "R?" H 1950 2250 50  0000 R CNN
F 1 "46.4R" H 1950 2150 50  0000 R CNN
F 2 "" H 2000 2200 50  0001 C CNN
F 3 "~" H 2000 2200 50  0001 C CNN
F 4 "Class 3" H 1950 2050 50  0000 R CNN "Class"
	1    2000 2200
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D?
U 1 1 612A0041
P 3650 1400
F 0 "D?" V 3696 1330 50  0000 R CNN
F 1 "APD" V 3605 1330 50  0000 R CNN
F 2 "" V 3650 1400 50  0001 C CNN
F 3 "~" V 3650 1400 50  0001 C CNN
	1    3650 1400
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED_Small D?
U 1 1 612A0C59
P 3950 1400
F 0 "D?" V 3996 1330 50  0000 R CNN
F 1 "T2P" V 3905 1330 50  0000 R CNN
F 2 "" V 3950 1400 50  0001 C CNN
F 3 "~" V 3950 1400 50  0001 C CNN
	1    3950 1400
	0    -1   -1   0   
$EndComp
$Comp
L Device:CP_Small C?
U 1 1 612A4786
P 4300 1400
F 0 "C?" H 4388 1491 50  0000 L CNN
F 1 "CBulk" H 4388 1400 50  0000 L CNN
F 2 "" H 4300 1400 50  0001 C CNN
F 3 "~" H 4300 1400 50  0001 C CNN
F 4 "100V" H 4388 1309 50  0000 L CNN "Rating"
	1    4300 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R?
U 1 1 612A57FC
P 3650 1600
F 0 "R?" H 3718 1646 50  0000 L CNN
F 1 "RAPD" H 3718 1555 50  0000 L CNN
F 2 "" H 3650 1600 50  0001 C CNN
F 3 "~" H 3650 1600 50  0001 C CNN
	1    3650 1600
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R?
U 1 1 612A5DC2
P 3950 1600
F 0 "R?" H 4018 1646 50  0000 L CNN
F 1 "RT2P" H 4018 1555 50  0000 L CNN
F 2 "" H 3950 1600 50  0001 C CNN
F 3 "~" H 3950 1600 50  0001 C CNN
	1    3950 1600
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R?
U 1 1 612A632C
P 5050 1400
F 0 "R?" H 5118 1446 50  0000 L CNN
F 1 "RCL" H 5118 1355 50  0000 L CNN
F 2 "" H 5050 1400 50  0001 C CNN
F 3 "~" H 5050 1400 50  0001 C CNN
	1    5050 1400
	-1   0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 612A6CFB
P 5250 1400
F 0 "C?" H 5342 1491 50  0000 L CNN
F 1 "CCL" H 5342 1400 50  0000 L CNN
F 2 "" H 5250 1400 50  0001 C CNN
F 3 "~" H 5250 1400 50  0001 C CNN
F 4 "100V" H 5342 1309 50  0000 L CNN "Rating"
	1    5250 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Small D?
U 1 1 612BB4AD
P 5450 1600
F 0 "D?" H 5450 1807 50  0000 C CNN
F 1 "DCL" H 5450 1716 50  0000 C CNN
F 2 "" V 5450 1600 50  0001 C CNN
F 3 "~" V 5450 1600 50  0001 C CNN
	1    5450 1600
	1    0    0    1   
$EndComp
Wire Wire Line
	5350 1600 5250 1600
Wire Wire Line
	5050 1600 5050 1500
Wire Wire Line
	5250 1500 5250 1600
Connection ~ 5250 1600
Wire Wire Line
	5250 1600 5050 1600
Wire Wire Line
	5050 1300 5050 1200
Wire Wire Line
	5050 1200 5250 1200
Wire Wire Line
	5250 1200 5250 1300
Wire Wire Line
	5550 1600 5600 1600
$Comp
L Transistor_FET:IRF3205 Q?
U 1 1 612FB31F
P 5500 1950
F 0 "Q?" H 5650 2100 50  0000 L CNN
F 1 "IRF3205" H 5650 1800 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 5750 1875 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irf3205.pdf" H 5500 1950 50  0001 L CNN
	1    5500 1950
	1    0    0    -1  
$EndComp
Text Label 1750 3850 0    50   ~ 0
ETH_GND
Wire Wire Line
	2750 3850 2750 3750
Wire Wire Line
	2750 3850 2850 3850
Wire Wire Line
	2850 3850 2850 3750
Connection ~ 2750 3850
Wire Wire Line
	2850 3850 2950 3850
Wire Wire Line
	2950 3850 2950 3750
Connection ~ 2850 3850
$Comp
L Device:C_Small C?
U 1 1 61372F4E
P 3650 3550
F 0 "C?" H 3700 3650 50  0000 L CNN
F 1 "0.1u" H 3700 3450 50  0000 L CNN
F 2 "" H 3650 3550 50  0001 C CNN
F 3 "~" H 3650 3550 50  0001 C CNN
	1    3650 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 61374682
P 4050 3550
F 0 "C?" H 4100 3650 50  0000 L CNN
F 1 "CSST" H 4100 3450 50  0000 L CNN
F 2 "" H 4050 3550 50  0001 C CNN
F 3 "~" H 4050 3550 50  0001 C CNN
	1    4050 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 61377123
P 3900 2500
F 0 "C?" V 3950 2600 50  0000 L CNN
F 1 "CCOMP" V 3950 2200 50  0000 L CNN
F 2 "" H 3900 2500 50  0001 C CNN
F 3 "~" H 3900 2500 50  0001 C CNN
	1    3900 2500
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small_US R?
U 1 1 613775F9
P 4100 2650
F 0 "R?" H 4032 2696 50  0000 R CNN
F 1 "RCOMP" H 4032 2605 50  0000 R CNN
F 2 "" H 4100 2650 50  0001 C CNN
F 3 "~" H 4100 2650 50  0001 C CNN
	1    4100 2650
	-1   0    0    -1  
$EndComp
$Comp
L Device:D_Small D?
U 1 1 61380751
P 4750 2500
F 0 "D?" H 4750 2293 50  0000 C CNN
F 1 "DCC" H 4750 2384 50  0000 C CNN
F 2 "" V 4750 2500 50  0001 C CNN
F 3 "~" V 4750 2500 50  0001 C CNN
	1    4750 2500
	1    0    0    1   
$EndComp
$Comp
L Device:R_Small_US R?
U 1 1 6138123F
P 4950 2950
F 0 "R?" H 4882 2996 50  0000 R CNN
F 1 "R2" H 4882 2905 50  0000 R CNN
F 2 "" H 4950 2950 50  0001 C CNN
F 3 "~" H 4950 2950 50  0001 C CNN
	1    4950 2950
	-1   0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6138192A
P 5200 2650
F 0 "C?" H 5292 2696 50  0000 L CNN
F 1 "CCC2" H 5292 2605 50  0000 L CNN
F 2 "" H 5200 2650 50  0001 C CNN
F 3 "~" H 5200 2650 50  0001 C CNN
	1    5200 2650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 61383840
P 4600 2650
F 0 "C?" H 4508 2696 50  0000 R CNN
F 1 "1u" H 4508 2605 50  0000 R CNN
F 2 "" H 4600 2650 50  0001 C CNN
F 3 "~" H 4600 2650 50  0001 C CNN
F 4 "25V" H 4600 2650 50  0001 C CNN "Rating"
	1    4600 2650
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3550 3250 3900 3250
Wire Wire Line
	3550 3100 4050 3100
Wire Wire Line
	4050 3100 4050 3450
Wire Wire Line
	3550 3400 3650 3400
Wire Wire Line
	3650 3400 3650 3450
Wire Wire Line
	3650 3650 3650 3850
Wire Wire Line
	3650 3850 3900 3850
Wire Wire Line
	4050 3650 4050 3850
Connection ~ 4050 3850
Wire Wire Line
	3900 3250 3900 3850
Connection ~ 3900 3850
Wire Wire Line
	3900 3850 4050 3850
Wire Wire Line
	3550 2500 3800 2500
Wire Wire Line
	3550 2800 4100 2800
Wire Wire Line
	4000 2500 4100 2500
Wire Wire Line
	4100 2500 4100 2550
Wire Wire Line
	4100 2750 4100 2800
Connection ~ 4100 2800
Wire Wire Line
	4650 2500 4600 2500
Wire Wire Line
	4600 2500 4600 2550
Wire Wire Line
	4600 2500 4600 2350
Wire Wire Line
	4600 2350 3550 2350
Connection ~ 4600 2500
Wire Wire Line
	4950 2550 4950 2500
Wire Wire Line
	4950 2500 4850 2500
Wire Wire Line
	4100 2800 4600 2800
Wire Wire Line
	4950 2750 4950 2800
Wire Wire Line
	4950 2800 4950 2850
Connection ~ 4950 2800
Wire Wire Line
	4600 2800 4600 2750
Connection ~ 4600 2800
Wire Wire Line
	4600 2800 4950 2800
Wire Wire Line
	4950 3850 4950 3050
Wire Wire Line
	4050 3850 4950 3850
Wire Wire Line
	4950 2500 5200 2500
Wire Wire Line
	5200 2500 5200 2550
Connection ~ 4950 2500
Wire Wire Line
	5200 2750 5200 3850
Wire Wire Line
	5200 3850 4950 3850
Connection ~ 4950 3850
Wire Wire Line
	3550 1750 3650 1750
Wire Wire Line
	3650 1750 3650 1700
Wire Wire Line
	3950 1700 3950 1900
Wire Wire Line
	3950 1900 3550 1900
Wire Wire Line
	4300 1500 4300 1650
Text Label 4350 1650 0    50   ~ 0
ETH_GND
Wire Wire Line
	4700 1650 4300 1650
Wire Wire Line
	5600 1750 5600 1600
Wire Wire Line
	5300 1950 5200 1950
Wire Wire Line
	5200 2050 5200 1950
Wire Wire Line
	5050 1200 4300 1200
Connection ~ 5050 1200
Wire Wire Line
	4300 1300 4300 1200
Connection ~ 4300 1200
Wire Wire Line
	4300 1200 3950 1200
Wire Wire Line
	3950 1300 3950 1200
Wire Wire Line
	3650 1300 3650 1200
$Comp
L Device:Transformer_1P_2S T?
U 1 1 6159BBDB
P 6450 2100
F 0 "T?" H 6450 1475 50  0000 C CNN
F 1 "Transformer_1P_2S" H 6450 1566 50  0000 C CNN
F 2 "" H 6450 2100 50  0001 C CNN
F 3 "~" H 6450 2100 50  0001 C CNN
	1    6450 2100
	-1   0    0    1   
$EndComp
Wire Wire Line
	5600 2150 5600 2200
Connection ~ 5600 2200
Wire Wire Line
	3550 2050 5200 2050
Wire Wire Line
	3550 2200 5600 2200
$Comp
L jkiv-ti:TPS23731 U?
U 1 1 6123A7A2
P 2950 2500
F 0 "U?" H 2925 3765 50  0000 C CNN
F 1 "TPS23731" H 2925 3674 50  0000 C CNN
F 2 "" H 900 1150 50  0001 C CNN
F 3 "" H 900 1150 50  0001 C CNN
	1    2950 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 3850 5600 3850
Wire Wire Line
	5850 3850 5850 2200
Connection ~ 5200 3850
Wire Wire Line
	5200 2500 6050 2500
Connection ~ 5200 2500
Wire Wire Line
	6050 2200 5850 2200
Connection ~ 5600 1600
Wire Wire Line
	6050 1700 6050 1200
Wire Wire Line
	6050 1200 5250 1200
Connection ~ 5250 1200
Wire Wire Line
	6050 2000 5850 2000
Wire Wire Line
	5850 1600 5850 2000
Wire Wire Line
	5600 1600 5850 1600
Text Notes 6550 2250 0    394  ~ 0
.
Text Notes 6150 2500 0    394  ~ 0
.
Text Notes 6150 2000 0    394  ~ 0
.
Text Notes 6500 4000 1    50   ~ 0
TODO find a transformer that is good
$Comp
L Device:L_Core_Ferrite_Coupled L?
U 1 1 618323B0
P 7450 2100
F 0 "L?" H 7450 2381 50  0000 C CNN
F 1 "CMC" H 7450 2290 50  0000 C CNN
F 2 "" H 7450 2100 50  0001 C CNN
F 3 "~" H 7450 2100 50  0001 C CNN
	1    7450 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 1550 2300 1550
Wire Wire Line
	2300 2100 2000 2100
Wire Wire Line
	2000 2300 2300 2300
Wire Wire Line
	2300 1750 2000 1750
Wire Wire Line
	2000 2300 1750 2300
Connection ~ 2000 2300
Connection ~ 2000 1550
Wire Wire Line
	2000 1550 1750 1550
Wire Wire Line
	1750 1550 1750 1200
Wire Wire Line
	1750 1200 3650 1200
Connection ~ 1750 1550
Wire Wire Line
	1750 1550 1400 1550
Wire Wire Line
	1750 1800 1750 1550
Wire Wire Line
	1750 2000 1750 2300
Connection ~ 1750 2300
Wire Wire Line
	1750 2300 1400 2300
Wire Wire Line
	1400 1800 1400 1550
Wire Wire Line
	1400 2000 1400 2300
Wire Wire Line
	6850 1900 7150 1900
$Comp
L Device:D_Small D?
U 1 1 6199A713
P 6950 2300
F 0 "D?" H 6950 2507 50  0000 C CNN
F 1 "DOUT" H 6950 2416 50  0000 C CNN
F 2 "" V 6950 2300 50  0001 C CNN
F 3 "~" V 6950 2300 50  0001 C CNN
	1    6950 2300
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7250 2200 7150 2200
$Comp
L Device:CP_Small C?
U 1 1 617A8F9F
P 7800 2100
F 0 "C?" H 7888 2146 50  0000 L CNN
F 1 "470u" H 7888 2055 50  0000 L CNN
F 2 "" H 7800 2100 50  0001 C CNN
F 3 "~" H 7800 2100 50  0001 C CNN
	1    7800 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7800 2000 7650 2000
Wire Wire Line
	7650 2200 7800 2200
Text Notes 1000 4850 0    50   ~ 0
TODO aux power?
Wire Wire Line
	7050 2300 7100 2300
Wire Wire Line
	7100 2300 7100 2000
Wire Wire Line
	7100 2000 7250 2000
Wire Wire Line
	7150 1900 7150 2200
Connection ~ 7800 2200
Connection ~ 7800 2000
Connection ~ 9650 2200
Wire Wire Line
	9650 2200 9950 2200
Connection ~ 9650 2000
Wire Wire Line
	9650 2000 9950 2000
Wire Wire Line
	9650 2000 9500 2000
Wire Wire Line
	7800 2200 8200 2200
Connection ~ 8200 2000
Wire Wire Line
	8200 2000 7800 2000
$Comp
L Device:C_Small C?
U 1 1 61A9C9DC
P 9650 2100
F 0 "C?" H 9742 2146 50  0000 L CNN
F 1 "47u" H 9742 2055 50  0000 L CNN
F 2 "" H 9650 2100 50  0001 C CNN
F 3 "~" H 9650 2100 50  0001 C CNN
	1    9650 2100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 61A68F40
P 8200 2100
F 0 "C?" H 8292 2146 50  0000 L CNN
F 1 "47u" H 8292 2055 50  0000 L CNN
F 2 "" H 8200 2100 50  0001 C CNN
F 3 "~" H 8200 2100 50  0001 C CNN
	1    8200 2100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 61CE3720
P 8500 2100
F 0 "C?" H 8592 2146 50  0000 L CNN
F 1 "47u" H 8592 2055 50  0000 L CNN
F 2 "" H 8500 2100 50  0001 C CNN
F 3 "~" H 8500 2100 50  0001 C CNN
	1    8500 2100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 61CE38BA
P 8800 2100
F 0 "C?" H 8892 2146 50  0000 L CNN
F 1 "47u" H 8892 2055 50  0000 L CNN
F 2 "" H 8800 2100 50  0001 C CNN
F 3 "~" H 8800 2100 50  0001 C CNN
	1    8800 2100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 61CE3C8C
P 9100 2100
F 0 "C?" H 9192 2146 50  0000 L CNN
F 1 "47u" H 9192 2055 50  0000 L CNN
F 2 "" H 9100 2100 50  0001 C CNN
F 3 "~" H 9100 2100 50  0001 C CNN
	1    9100 2100
	1    0    0    -1  
$EndComp
$Comp
L Device:Ferrite_Bead_Small FB?
U 1 1 6185439B
P 9400 2000
F 0 "FB?" V 9163 2000 50  0000 C CNN
F 1 "FB" V 9254 2000 50  0000 C CNN
F 2 "" V 9330 2000 50  0001 C CNN
F 3 "~" H 9400 2000 50  0001 C CNN
	1    9400 2000
	0    1    1    0   
$EndComp
Wire Wire Line
	8200 2000 8500 2000
Connection ~ 8500 2000
Wire Wire Line
	8500 2000 8800 2000
Connection ~ 8800 2000
Wire Wire Line
	8800 2000 9100 2000
Connection ~ 9100 2000
Wire Wire Line
	9100 2000 9300 2000
Wire Wire Line
	8200 2200 8500 2200
Connection ~ 8200 2200
Connection ~ 8500 2200
Wire Wire Line
	8500 2200 8800 2200
Connection ~ 8800 2200
Wire Wire Line
	8800 2200 9100 2200
Wire Wire Line
	9100 2200 9650 2200
Connection ~ 9100 2200
$Comp
L Device:C_Small C?
U 1 1 61D41700
P 9950 2100
F 0 "C?" H 10042 2146 50  0000 L CNN
F 1 "47u" H 10042 2055 50  0000 L CNN
F 2 "" H 9950 2100 50  0001 C CNN
F 3 "~" H 9950 2100 50  0001 C CNN
	1    9950 2100
	1    0    0    -1  
$EndComp
Connection ~ 9950 2000
Wire Wire Line
	9950 2000 10150 2000
Connection ~ 9950 2200
Wire Wire Line
	9950 2200 10150 2200
Wire Wire Line
	2950 3850 3150 3850
Connection ~ 2950 3850
Connection ~ 3650 3850
$Comp
L Device:R_Small_US R?
U 1 1 61D6FFA1
P 5600 3050
F 0 "R?" H 5532 3096 50  0000 R CNN
F 1 "RCS" H 5532 3005 50  0000 R CNN
F 2 "" H 5600 3050 50  0001 C CNN
F 3 "~" H 5600 3050 50  0001 C CNN
	1    5600 3050
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5600 2200 5600 2950
Wire Wire Line
	5600 3150 5600 3850
Connection ~ 5600 3850
Wire Wire Line
	5600 3850 5850 3850
Text Notes 800  1050 0    50   ~ 0
Mostly from data sheet example, with tweaks.
Wire Wire Line
	1300 2300 1400 2300
Connection ~ 1400 2300
Wire Wire Line
	1400 1550 1300 1550
Connection ~ 1400 1550
Wire Wire Line
	10150 1950 10150 2000
$Comp
L Device:R_Small_US R?
U 1 1 61E3102E
P 6800 5200
F 0 "R?" V 6595 5200 50  0000 C CNN
F 1 "0.1R" V 6686 5200 50  0000 C CNN
F 2 "" H 6800 5200 50  0001 C CNN
F 3 "~" H 6800 5200 50  0001 C CNN
	1    6800 5200
	0    1    1    0   
$EndComp
Wire Wire Line
	6900 5200 6950 5200
Connection ~ 6950 5200
Wire Wire Line
	6550 5200 6550 5100
Wire Wire Line
	6550 5200 6700 5200
$Comp
L power:+5V #PWR?
U 1 1 61F354E9
P 6550 5100
F 0 "#PWR?" H 6550 4950 50  0001 C CNN
F 1 "+5V" H 6565 5273 50  0000 C CNN
F 2 "" H 6550 5100 50  0001 C CNN
F 3 "" H 6550 5100 50  0001 C CNN
	1    6550 5100
	1    0    0    -1  
$EndComp
Text Notes 750  5400 0    50   ~ 0
TODO wago terminals?
$Comp
L Connector_Generic:Conn_01x02 J?
U 1 1 617E4843
P 1100 5850
AR Path="/5FF26697/617E4843" Ref="J?"  Part="1" 
AR Path="/5FF26697/5FF520B9/617E4843" Ref="J?"  Part="1" 
F 0 "J?" H 1180 5842 50  0000 L CNN
F 1 "PWR_ALT_5" H 1180 5751 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 1100 5850 50  0001 C CNN
F 3 "~" H 1100 5850 50  0001 C CNN
	1    1100 5850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0148
U 1 1 6123EA77
P 850 5750
F 0 "#PWR0148" H 850 5600 50  0001 C CNN
F 1 "+5V" H 865 5923 50  0000 C CNN
F 2 "" H 850 5750 50  0001 C CNN
F 3 "" H 850 5750 50  0001 C CNN
	1    850  5750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61A786EF
P 850 6050
AR Path="/5FF26697/61A786EF" Ref="#PWR?"  Part="1" 
AR Path="/5FF26697/5FF520B9/61A786EF" Ref="#PWR0246"  Part="1" 
F 0 "#PWR0246" H 850 5800 50  0001 C CNN
F 1 "GND" H 855 5877 50  0000 C CNN
F 2 "" H 850 6050 50  0001 C CNN
F 3 "" H 850 6050 50  0001 C CNN
	1    850  6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	850  6050 850  5950
Wire Wire Line
	850  5950 900  5950
Wire Wire Line
	900  5850 850  5850
Wire Wire Line
	850  5750 850  5850
Text Notes 1100 5100 0    50   ~ 0
TODO AUX 48V
$Comp
L power:+5V #PWR?
U 1 1 6181B570
P 10150 1950
F 0 "#PWR?" H 10150 1800 50  0001 C CNN
F 1 "+5V" H 10165 2123 50  0000 C CNN
F 2 "" H 10150 1950 50  0001 C CNN
F 3 "" H 10150 1950 50  0001 C CNN
	1    10150 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 620506E8
P 10150 2200
AR Path="/5FF26697/620506E8" Ref="#PWR?"  Part="1" 
AR Path="/5FF26697/5FF520B9/620506E8" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 10150 1950 50  0001 C CNN
F 1 "GND" H 10155 2027 50  0000 C CNN
F 2 "" H 10150 2200 50  0001 C CNN
F 3 "" H 10150 2200 50  0001 C CNN
	1    10150 2200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 611DD129
P 9450 5700
F 0 "C?" H 9542 5746 50  0000 L CNN
F 1 "22u" H 9542 5655 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric" H 9450 5700 50  0001 C CNN
F 3 "~" H 9450 5700 50  0001 C CNN
	1    9450 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 5800 9450 5950
Text Notes 9650 5550 0    50   ~ 0
TODO bulk 3v3 cap?
Text Notes 6450 4700 0    50   ~ 0
FPGA Power
Text Label 7800 5200 2    50   ~ 0
5V
Wire Wire Line
	7950 4400 7800 4400
Wire Wire Line
	8150 4400 8350 4400
Text Label 7950 4700 2    50   ~ 0
5V
Wire Wire Line
	7950 4700 7750 4700
Wire Wire Line
	8150 4700 8350 4700
Wire Notes Line
	2600 4650 5000 4650
Wire Notes Line
	5000 4650 5000 6400
Wire Notes Line
	5000 6400 2600 6400
Wire Notes Line
	2600 6400 2600 4650
Text Notes 1650 3400 1    50   ~ 0
AGND
Text HLabel 1600 3850 0    50   Input ~ 0
ETH_GND
Text Notes 1050 3000 0    50   ~ 0
TODO Uhh pulse?
$Comp
L Device:R_Small_US R?
U 1 1 61380D64
P 4950 2650
F 0 "R?" H 4882 2696 50  0000 R CNN
F 1 "R1" H 4882 2605 50  0000 R CNN
F 2 "" H 4950 2650 50  0001 C CNN
F 3 "~" H 4950 2650 50  0001 C CNN
	1    4950 2650
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1750 3100 1700 3100
$Comp
L Device:R_Small_US R?
U 1 1 62253C82
P 1850 3100
F 0 "R?" V 1750 3050 50  0000 L CNN
F 1 "60.4k" V 1950 3000 50  0000 L CNN
F 2 "" H 1850 3100 50  0001 C CNN
F 3 "~" H 1850 3100 50  0001 C CNN
	1    1850 3100
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small_US R?
U 1 1 622F685E
P 2150 3100
F 0 "R?" V 2250 3100 50  0000 C CNN
F 1 "235k" V 2050 3100 50  0000 C CNN
F 2 "" H 2150 3100 50  0001 C CNN
F 3 "~" H 2150 3100 50  0001 C CNN
	1    2150 3100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1950 3100 2000 3100
Wire Wire Line
	2000 3100 2000 2950
Wire Wire Line
	2000 2950 2300 2950
Connection ~ 2000 3100
Wire Wire Line
	2000 3100 2050 3100
Wire Wire Line
	2250 3100 2300 3100
Connection ~ 2250 3100
$Comp
L Device:C_Small C?
U 1 1 62346498
P 1950 3450
F 0 "C?" H 2042 3496 50  0000 L CNN
F 1 "2.2n" H 2042 3405 50  0000 L CNN
F 2 "" H 1950 3450 50  0001 C CNN
F 3 "~" H 1950 3450 50  0001 C CNN
	1    1950 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 3600 1700 3600
Wire Wire Line
	1950 3300 1950 3350
Wire Wire Line
	1950 3300 2250 3300
Wire Wire Line
	2250 3100 2250 3300
Connection ~ 1700 3600
Wire Wire Line
	1700 3100 1700 3600
Wire Wire Line
	1950 3600 1950 3550
Wire Wire Line
	1600 3850 1700 3850
Wire Wire Line
	1700 3600 1700 3850
Connection ~ 1700 3850
Wire Wire Line
	1700 3850 2750 3850
Text Label 2300 2650 2    50   ~ 0
ETH_GND
Wire Wire Line
	1750 2650 2300 2650
Text Notes 1750 2650 0    50   ~ 0
RTN
$Comp
L Device:R_Small_US R?
U 1 1 623F52D2
P 1800 2500
F 0 "R?" V 1750 2300 50  0000 L CNN
F 1 "49.9k" V 1750 2600 50  0000 L CNN
F 2 "" H 1800 2500 50  0001 C CNN
F 3 "~" H 1800 2500 50  0001 C CNN
F 4 "1%" V 1750 2900 50  0000 C CNN "Tolerance"
	1    1800 2500
	0    1    1    0   
$EndComp
Wire Wire Line
	1400 2500 1400 2300
Wire Wire Line
	1700 2500 1400 2500
Wire Wire Line
	1900 2500 2300 2500
Wire Wire Line
	3650 1200 3950 1200
Connection ~ 3650 1200
Connection ~ 3950 1200
Text Notes 3700 3800 0    50   ~ 0
AGND
Text Notes 4100 3800 0    50   ~ 0
RTN
Text Notes 4400 3950 1    50   ~ 0
TODO DC/DC Startup rate
Text Notes 2000 3600 0    50   ~ 0
RTN
Text Notes 1250 4150 0    50   ~ 0
If DTHR not used, short to VB\nIf LINEUV not used, short to VB
Wire Wire Line
	3150 3750 3150 3850
Connection ~ 3150 3850
Wire Wire Line
	3150 3850 3550 3850
Text Notes 2550 4050 0    50   ~ 0
If diode rectification, PSRS = AGND
$Comp
L Device:R_Small_US R?
U 1 1 62456BA1
P 3400 3800
F 0 "R?" V 3300 3750 50  0000 L CNN
F 1 "RSTP" V 3500 3700 50  0000 L CNN
F 2 "" H 3400 3800 50  0001 C CNN
F 3 "~" H 3400 3800 50  0001 C CNN
	1    3400 3800
	0    1    1    0   
$EndComp
Text Notes 3550 3800 1    50   ~ 0
AGND
Wire Wire Line
	3500 3800 3550 3800
Wire Wire Line
	3550 3800 3550 3850
Connection ~ 3550 3850
Wire Wire Line
	3550 3850 3650 3850
Wire Wire Line
	3300 3800 3250 3800
Wire Wire Line
	3250 3800 3250 3750
Text Label 3550 3400 0    50   ~ 0
VB
Text Label 5900 2000 0    50   ~ 0
SW_S
Text Label 5600 2350 2    50   ~ 0
SW_D
Text Label 5200 2050 2    50   ~ 0
SW_G
Text Notes 6650 2450 0    50   ~ 0
=5.1V
$EndSCHEMATC
