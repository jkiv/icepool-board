EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
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
L dk_PMIC-Voltage-Regulators-Linear:LD1117S33CTR U?
U 1 1 5D72896C
P 1900 1200
F 0 "U?" H 1950 1487 60  0000 C CNN
F 1 "LD1117S33CTR" H 1950 1381 60  0000 C CNN
F 2 "digikey-footprints:SOT-223" H 2100 1400 60  0001 L CNN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/99/3b/7d/91/91/51/4b/be/CD00000544.pdf/files/CD00000544.pdf/jcr:content/translations/en.CD00000544.pdf" H 2100 1500 60  0001 L CNN
F 4 "497-1241-1-ND" H 2100 1600 60  0001 L CNN "Digi-Key_PN"
F 5 "LD1117S33CTR" H 2100 1700 60  0001 L CNN "MPN"
F 6 "Integrated Circuits (ICs)" H 2100 1800 60  0001 L CNN "Category"
F 7 "PMIC - Voltage Regulators - Linear" H 2100 1900 60  0001 L CNN "Family"
F 8 "http://www.st.com/content/ccc/resource/technical/document/datasheet/99/3b/7d/91/91/51/4b/be/CD00000544.pdf/files/CD00000544.pdf/jcr:content/translations/en.CD00000544.pdf" H 2100 2000 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/stmicroelectronics/LD1117S33CTR/497-1241-1-ND/586241" H 2100 2100 60  0001 L CNN "DK_Detail_Page"
F 10 "IC REG LINEAR 3.3V 800MA SOT223" H 2100 2200 60  0001 L CNN "Description"
F 11 "STMicroelectronics" H 2100 2300 60  0001 L CNN "Manufacturer"
F 12 "Active" H 2100 2400 60  0001 L CNN "Status"
	1    1900 1200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D72B43C
P 1300 1300
F 0 "C?" H 1392 1346 50  0000 L CNN
F 1 "100nF" H 1392 1255 50  0000 L CNN
F 2 "" H 1300 1300 50  0001 C CNN
F 3 "~" H 1300 1300 50  0001 C CNN
	1    1300 1300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D72BCCE
P 2950 1300
F 0 "C?" H 3042 1346 50  0000 L CNN
F 1 "10uF" H 3042 1255 50  0000 L CNN
F 2 "" H 2950 1300 50  0001 C CNN
F 3 "~" H 2950 1300 50  0001 C CNN
	1    2950 1300
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R?
U 1 1 5D72C930
P 2500 1300
F 0 "R?" H 2568 1346 50  0000 L CNN
F 1 "120R" H 2568 1255 50  0000 L CNN
F 2 "" H 2500 1300 50  0001 C CNN
F 3 "~" H 2500 1300 50  0001 C CNN
	1    2500 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 1200 2500 1200
Connection ~ 2500 1200
Wire Wire Line
	2500 1200 2950 1200
Wire Wire Line
	2300 1300 2300 1200
Connection ~ 2300 1200
Wire Wire Line
	1600 1200 1300 1200
Wire Wire Line
	1300 1200 1300 1000
Connection ~ 1300 1200
Wire Wire Line
	1300 1400 1300 1500
Wire Wire Line
	1300 1500 1900 1500
Wire Wire Line
	1900 1500 2500 1500
Wire Wire Line
	2950 1500 2950 1400
Connection ~ 1900 1500
Wire Wire Line
	2500 1400 2500 1500
Connection ~ 2500 1500
Wire Wire Line
	2500 1500 2950 1500
Wire Wire Line
	1900 1500 1900 1600
$Comp
L power:GND #PWR?
U 1 1 5D73163F
P 1900 1600
F 0 "#PWR?" H 1900 1350 50  0001 C CNN
F 1 "GND" H 1905 1427 50  0000 C CNN
F 2 "" H 1900 1600 50  0001 C CNN
F 3 "" H 1900 1600 50  0001 C CNN
	1    1900 1600
	1    0    0    -1  
$EndComp
$Comp
L dk_PMIC-Voltage-Regulators-Linear:LD1117S33CTR U?
U 1 1 5D739459
P 4150 1200
F 0 "U?" H 4200 1487 60  0000 C CNN
F 1 "LD1117S33CTR" H 4200 1381 60  0000 C CNN
F 2 "digikey-footprints:SOT-223" H 4350 1400 60  0001 L CNN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/99/3b/7d/91/91/51/4b/be/CD00000544.pdf/files/CD00000544.pdf/jcr:content/translations/en.CD00000544.pdf" H 4350 1500 60  0001 L CNN
F 4 "497-1241-1-ND" H 4350 1600 60  0001 L CNN "Digi-Key_PN"
F 5 "LD1117S33CTR" H 4350 1700 60  0001 L CNN "MPN"
F 6 "Integrated Circuits (ICs)" H 4350 1800 60  0001 L CNN "Category"
F 7 "PMIC - Voltage Regulators - Linear" H 4350 1900 60  0001 L CNN "Family"
F 8 "http://www.st.com/content/ccc/resource/technical/document/datasheet/99/3b/7d/91/91/51/4b/be/CD00000544.pdf/files/CD00000544.pdf/jcr:content/translations/en.CD00000544.pdf" H 4350 2000 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/stmicroelectronics/LD1117S33CTR/497-1241-1-ND/586241" H 4350 2100 60  0001 L CNN "DK_Detail_Page"
F 10 "IC REG LINEAR 3.3V 800MA SOT223" H 4350 2200 60  0001 L CNN "Description"
F 11 "STMicroelectronics" H 4350 2300 60  0001 L CNN "Manufacturer"
F 12 "Active" H 4350 2400 60  0001 L CNN "Status"
	1    4150 1200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D73945F
P 3550 1300
F 0 "C?" H 3642 1346 50  0000 L CNN
F 1 "100nF" H 3642 1255 50  0000 L CNN
F 2 "" H 3550 1300 50  0001 C CNN
F 3 "~" H 3550 1300 50  0001 C CNN
	1    3550 1300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D739465
P 5200 1300
F 0 "C?" H 5292 1346 50  0000 L CNN
F 1 "10uF" H 5292 1255 50  0000 L CNN
F 2 "" H 5200 1300 50  0001 C CNN
F 3 "~" H 5200 1300 50  0001 C CNN
	1    5200 1300
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R?
U 1 1 5D73946B
P 4750 1300
F 0 "R?" H 4818 1346 50  0000 L CNN
F 1 "120R" H 4818 1255 50  0000 L CNN
F 2 "" H 4750 1300 50  0001 C CNN
F 3 "~" H 4750 1300 50  0001 C CNN
	1    4750 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 1200 4750 1200
Connection ~ 4750 1200
Wire Wire Line
	4750 1200 5200 1200
Wire Wire Line
	4550 1300 4550 1200
Connection ~ 4550 1200
Wire Wire Line
	3850 1200 3550 1200
Wire Wire Line
	3550 1200 3550 1000
Connection ~ 3550 1200
Wire Wire Line
	3550 1400 3550 1500
Wire Wire Line
	3550 1500 4150 1500
Wire Wire Line
	4150 1500 4750 1500
Wire Wire Line
	5200 1500 5200 1400
Connection ~ 4150 1500
Wire Wire Line
	4750 1400 4750 1500
Connection ~ 4750 1500
Wire Wire Line
	4750 1500 5200 1500
Wire Wire Line
	4150 1500 4150 1600
$Comp
L power:GND #PWR?
U 1 1 5D739488
P 4150 1600
F 0 "#PWR?" H 4150 1350 50  0001 C CNN
F 1 "GND" H 4155 1427 50  0000 C CNN
F 2 "" H 4150 1600 50  0001 C CNN
F 3 "" H 4150 1600 50  0001 C CNN
	1    4150 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 1200 2950 1000
Connection ~ 2950 1200
Wire Wire Line
	5200 1200 5200 1000
Connection ~ 5200 1200
$Comp
L power:+3.3V #PWR?
U 1 1 5D73E056
P 2950 1000
F 0 "#PWR?" H 2950 850 50  0001 C CNN
F 1 "+3.3V" H 2965 1173 50  0000 C CNN
F 2 "" H 2950 1000 50  0001 C CNN
F 3 "" H 2950 1000 50  0001 C CNN
	1    2950 1000
	1    0    0    -1  
$EndComp
$Comp
L power:+1V2 #PWR?
U 1 1 5D73F6FB
P 5200 1000
F 0 "#PWR?" H 5200 850 50  0001 C CNN
F 1 "+1V2" H 5215 1173 50  0000 C CNN
F 2 "" H 5200 1000 50  0001 C CNN
F 3 "" H 5200 1000 50  0001 C CNN
	1    5200 1000
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5D73FD90
P 1300 1000
F 0 "#PWR?" H 1300 850 50  0001 C CNN
F 1 "VCC" H 1317 1173 50  0000 C CNN
F 2 "" H 1300 1000 50  0001 C CNN
F 3 "" H 1300 1000 50  0001 C CNN
	1    1300 1000
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5D740378
P 3550 1000
F 0 "#PWR?" H 3550 850 50  0001 C CNN
F 1 "VCC" H 3567 1173 50  0000 C CNN
F 2 "" H 3550 1000 50  0001 C CNN
F 3 "" H 3550 1000 50  0001 C CNN
	1    3550 1000
	1    0    0    -1  
$EndComp
Text Notes 1300 2100 0    50   ~ 0
ARM Core Voltage = +3.3V\nFPGA I/O Voltage = +3.3V\nImax = 800mA
Text Notes 3500 2000 0    50   ~ 0
FPGA Core Voltage = +1.2V\nImax = 800mA
Text Notes 10600 7650 0    50   ~ 0
2019-00
Text Notes 7350 7500 0    50   ~ 0
"icepool" prototype board
$EndSCHEMATC
