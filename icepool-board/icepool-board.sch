EESchema Schematic File Version 4
LIBS:icepool-board-cache
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
P 1450 1150
F 0 "U?" H 1500 1437 60  0000 C CNN
F 1 "LD1117S33CTR" H 1500 1331 60  0000 C CNN
F 2 "digikey-footprints:SOT-223" H 1650 1350 60  0001 L CNN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/99/3b/7d/91/91/51/4b/be/CD00000544.pdf/files/CD00000544.pdf/jcr:content/translations/en.CD00000544.pdf" H 1650 1450 60  0001 L CNN
F 4 "497-1241-1-ND" H 1650 1550 60  0001 L CNN "Digi-Key_PN"
F 5 "LD1117S33CTR" H 1650 1650 60  0001 L CNN "MPN"
F 6 "Integrated Circuits (ICs)" H 1650 1750 60  0001 L CNN "Category"
F 7 "PMIC - Voltage Regulators - Linear" H 1650 1850 60  0001 L CNN "Family"
F 8 "http://www.st.com/content/ccc/resource/technical/document/datasheet/99/3b/7d/91/91/51/4b/be/CD00000544.pdf/files/CD00000544.pdf/jcr:content/translations/en.CD00000544.pdf" H 1650 1950 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/stmicroelectronics/LD1117S33CTR/497-1241-1-ND/586241" H 1650 2050 60  0001 L CNN "DK_Detail_Page"
F 10 "IC REG LINEAR 3.3V 800MA SOT223" H 1650 2150 60  0001 L CNN "Description"
F 11 "STMicroelectronics" H 1650 2250 60  0001 L CNN "Manufacturer"
F 12 "Active" H 1650 2350 60  0001 L CNN "Status"
	1    1450 1150
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D72B43C
P 850 1250
F 0 "C?" H 942 1296 50  0000 L CNN
F 1 "100nF" H 942 1205 50  0000 L CNN
F 2 "" H 850 1250 50  0001 C CNN
F 3 "~" H 850 1250 50  0001 C CNN
	1    850  1250
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D72BCCE
P 2500 1250
F 0 "C?" H 2592 1296 50  0000 L CNN
F 1 "10uF" H 2592 1205 50  0000 L CNN
F 2 "" H 2500 1250 50  0001 C CNN
F 3 "~" H 2500 1250 50  0001 C CNN
	1    2500 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R?
U 1 1 5D72C930
P 2050 1250
F 0 "R?" H 2118 1296 50  0000 L CNN
F 1 "120R" H 2118 1205 50  0000 L CNN
F 2 "" H 2050 1250 50  0001 C CNN
F 3 "~" H 2050 1250 50  0001 C CNN
	1    2050 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 1150 2050 1150
Connection ~ 2050 1150
Wire Wire Line
	2050 1150 2500 1150
Wire Wire Line
	1850 1250 1850 1150
Connection ~ 1850 1150
Wire Wire Line
	1150 1150 850  1150
Wire Wire Line
	850  1150 850  950 
Connection ~ 850  1150
Wire Wire Line
	850  1350 850  1450
Wire Wire Line
	850  1450 1450 1450
Wire Wire Line
	1450 1450 2050 1450
Wire Wire Line
	2500 1450 2500 1350
Connection ~ 1450 1450
Wire Wire Line
	2050 1350 2050 1450
Connection ~ 2050 1450
Wire Wire Line
	2050 1450 2500 1450
Wire Wire Line
	1450 1450 1450 1550
$Comp
L power:GND #PWR?
U 1 1 5D73163F
P 1450 1550
F 0 "#PWR?" H 1450 1300 50  0001 C CNN
F 1 "GND" H 1455 1377 50  0000 C CNN
F 2 "" H 1450 1550 50  0001 C CNN
F 3 "" H 1450 1550 50  0001 C CNN
	1    1450 1550
	1    0    0    -1  
$EndComp
$Comp
L dk_PMIC-Voltage-Regulators-Linear:LD1117S33CTR U?
U 1 1 5D739459
P 3700 1150
F 0 "U?" H 3750 1437 60  0000 C CNN
F 1 "LD1117S33CTR" H 3750 1331 60  0000 C CNN
F 2 "digikey-footprints:SOT-223" H 3900 1350 60  0001 L CNN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/99/3b/7d/91/91/51/4b/be/CD00000544.pdf/files/CD00000544.pdf/jcr:content/translations/en.CD00000544.pdf" H 3900 1450 60  0001 L CNN
F 4 "497-1241-1-ND" H 3900 1550 60  0001 L CNN "Digi-Key_PN"
F 5 "LD1117S33CTR" H 3900 1650 60  0001 L CNN "MPN"
F 6 "Integrated Circuits (ICs)" H 3900 1750 60  0001 L CNN "Category"
F 7 "PMIC - Voltage Regulators - Linear" H 3900 1850 60  0001 L CNN "Family"
F 8 "http://www.st.com/content/ccc/resource/technical/document/datasheet/99/3b/7d/91/91/51/4b/be/CD00000544.pdf/files/CD00000544.pdf/jcr:content/translations/en.CD00000544.pdf" H 3900 1950 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/stmicroelectronics/LD1117S33CTR/497-1241-1-ND/586241" H 3900 2050 60  0001 L CNN "DK_Detail_Page"
F 10 "IC REG LINEAR 3.3V 800MA SOT223" H 3900 2150 60  0001 L CNN "Description"
F 11 "STMicroelectronics" H 3900 2250 60  0001 L CNN "Manufacturer"
F 12 "Active" H 3900 2350 60  0001 L CNN "Status"
	1    3700 1150
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D73945F
P 3100 1250
F 0 "C?" H 3192 1296 50  0000 L CNN
F 1 "100nF" H 3192 1205 50  0000 L CNN
F 2 "" H 3100 1250 50  0001 C CNN
F 3 "~" H 3100 1250 50  0001 C CNN
	1    3100 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D739465
P 4750 1250
F 0 "C?" H 4842 1296 50  0000 L CNN
F 1 "10uF" H 4842 1205 50  0000 L CNN
F 2 "" H 4750 1250 50  0001 C CNN
F 3 "~" H 4750 1250 50  0001 C CNN
	1    4750 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R?
U 1 1 5D73946B
P 4300 1250
F 0 "R?" H 4368 1296 50  0000 L CNN
F 1 "120R" H 4368 1205 50  0000 L CNN
F 2 "" H 4300 1250 50  0001 C CNN
F 3 "~" H 4300 1250 50  0001 C CNN
	1    4300 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 1150 4300 1150
Connection ~ 4300 1150
Wire Wire Line
	4300 1150 4750 1150
Wire Wire Line
	4100 1250 4100 1150
Connection ~ 4100 1150
Wire Wire Line
	3400 1150 3100 1150
Wire Wire Line
	3100 1150 3100 950 
Connection ~ 3100 1150
Wire Wire Line
	3100 1350 3100 1450
Wire Wire Line
	3100 1450 3700 1450
Wire Wire Line
	3700 1450 4300 1450
Wire Wire Line
	4750 1450 4750 1350
Connection ~ 3700 1450
Wire Wire Line
	4300 1350 4300 1450
Connection ~ 4300 1450
Wire Wire Line
	4300 1450 4750 1450
Wire Wire Line
	3700 1450 3700 1550
$Comp
L power:GND #PWR?
U 1 1 5D739488
P 3700 1550
F 0 "#PWR?" H 3700 1300 50  0001 C CNN
F 1 "GND" H 3705 1377 50  0000 C CNN
F 2 "" H 3700 1550 50  0001 C CNN
F 3 "" H 3700 1550 50  0001 C CNN
	1    3700 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 1150 2500 950 
Connection ~ 2500 1150
Wire Wire Line
	4750 1150 4750 950 
Connection ~ 4750 1150
$Comp
L power:+3.3V #PWR?
U 1 1 5D73E056
P 2500 950
F 0 "#PWR?" H 2500 800 50  0001 C CNN
F 1 "+3.3V" H 2515 1123 50  0000 C CNN
F 2 "" H 2500 950 50  0001 C CNN
F 3 "" H 2500 950 50  0001 C CNN
	1    2500 950 
	1    0    0    -1  
$EndComp
$Comp
L power:+1V2 #PWR?
U 1 1 5D73F6FB
P 4750 950
F 0 "#PWR?" H 4750 800 50  0001 C CNN
F 1 "+1V2" H 4765 1123 50  0000 C CNN
F 2 "" H 4750 950 50  0001 C CNN
F 3 "" H 4750 950 50  0001 C CNN
	1    4750 950 
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5D73FD90
P 850 950
F 0 "#PWR?" H 850 800 50  0001 C CNN
F 1 "VCC" H 867 1123 50  0000 C CNN
F 2 "" H 850 950 50  0001 C CNN
F 3 "" H 850 950 50  0001 C CNN
	1    850  950 
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5D740378
P 3100 950
F 0 "#PWR?" H 3100 800 50  0001 C CNN
F 1 "VCC" H 3117 1123 50  0000 C CNN
F 2 "" H 3100 950 50  0001 C CNN
F 3 "" H 3100 950 50  0001 C CNN
	1    3100 950 
	1    0    0    -1  
$EndComp
Text Notes 850  2050 0    50   ~ 0
ARM Core Voltage = +3.3V\nFPGA I/O Voltage = +3.3V\nImax = 800mA
Text Notes 3050 1950 0    50   ~ 0
FPGA Core Voltage = +1.2V\nImax = 800mA
Text Notes 10600 7650 0    50   ~ 0
2019-00
Text Notes 7350 7500 0    50   ~ 0
"icepool" prototype board
Wire Notes Line
	550  550  5200 550 
Wire Notes Line
	5200 550  5200 2250
Wire Notes Line
	5200 2250 550  2250
Wire Notes Line
	550  2250 550  550 
Text Notes 4950 2200 0    50   ~ 0
Power
$Comp
L icepool-atmel:ATSAMD21E U?
U 1 1 5D7394CA
P 3400 4200
F 0 "U?" H 3400 5565 50  0000 C CNN
F 1 "ATSAMD21E" H 3400 5474 50  0000 C CNN
F 2 "" H 3400 4350 50  0001 C CNN
F 3 "" H 3400 4350 50  0001 C CNN
	1    3400 4200
	1    0    0    -1  
$EndComp
Text Notes 600  2450 0    50   ~ 0
MCU
Wire Wire Line
	4100 3100 4200 3100
Wire Wire Line
	4200 3100 4200 3000
$Comp
L power:+3V3 #PWR?
U 1 1 5D73EC53
P 4200 3000
F 0 "#PWR?" H 4200 2850 50  0001 C CNN
F 1 "+3V3" H 4215 3173 50  0000 C CNN
F 2 "" H 4200 3000 50  0001 C CNN
F 3 "" H 4200 3000 50  0001 C CNN
	1    4200 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 5700 3300 5800
Wire Wire Line
	3300 5800 3450 5800
Wire Wire Line
	3450 5800 3450 5700
Wire Wire Line
	3300 5800 3300 5900
Connection ~ 3300 5800
$Comp
L power:GND #PWR?
U 1 1 5D740875
P 3300 5900
F 0 "#PWR?" H 3300 5650 50  0001 C CNN
F 1 "GND" H 3305 5727 50  0000 C CNN
F 2 "" H 3300 5900 50  0001 C CNN
F 3 "" H 3300 5900 50  0001 C CNN
	1    3300 5900
	1    0    0    -1  
$EndComp
Text Label 4150 3750 0    50   ~ 0
~RESET
Wire Wire Line
	2700 4900 2500 4900
Text Label 2650 5050 2    50   ~ 0
XOUT
Text Label 2650 4900 2    50   ~ 0
XIN
Text Label 4150 4150 0    50   ~ 0
SWCLK
Text Label 4150 4000 0    50   ~ 0
SWIO
Wire Wire Line
	4100 4150 4400 4150
Wire Wire Line
	4100 4000 4350 4000
Wire Wire Line
	2450 5050 2700 5050
Wire Wire Line
	4100 3250 4200 3250
Wire Wire Line
	4200 3250 4200 3100
Connection ~ 4200 3100
Wire Wire Line
	4100 3750 4400 3750
Text Notes 4550 3500 0    50   ~ 0
+1.2V
Text Label 4150 3500 0    50   ~ 0
VDDCORE
Wire Wire Line
	4100 3500 4500 3500
Text Notes 1800 3200 0    50   ~ 0
RS482\n- TX\n- RX
Text Notes 4550 4150 0    50   ~ 0
Debug\n- SWIO\n- SWCLK
Text Notes 1800 3800 0    50   ~ 0
FPGA SPI\n- GMOSI\n- MOSI\n- MISO\n- SCK\n- ~GS
Text Notes 1800 4150 0    50   ~ 0
FPGA Interrupt\n- ~DONE
Text Notes 1800 4500 0    50   ~ 0
Display (I2C)?\n- DATA\n- CLK
$EndSCHEMATC
