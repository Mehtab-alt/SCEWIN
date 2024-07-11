@echo off
@chcp 65001 >nul 2>&1

::Recent changes @ 12-07-2024
rem ASPM (Active State Power Management)    (Disabled)
rem TVB Voltage Optimizations   (Disabled) (00)
rem Boot performance mode   (Turbo Performance) (02)
rem SMM Use SMM en-US Indication (Disabled) (00)
rem MSI enabled (Enabled) (01)
rem SW Guard Extensions SGX (Software Controlled) (02)
rem PECI (Disabled) (00)
rem BIST Enable (Disabled) (00)
rem AP threads Idle Manner (RUN Loop) (03)
rem Intel(R) Speed Shift Technology Interrupt Control (Disabled) (00)
rem Race To Halt (Disabled) (00)
rem Native ASPM (Disabled) (00)
rem EC Notification (Disabled) (00)
rem P-state Capping (Disabled) (00)
rem Enable LTR (Disabled) (00)
rem USB 2.0 Controller Mode (HiSpeed) (01)
rem Voltage Optimization (Disabled) (00)
rem HDD Acoustic mode (Performance) (FE)
rem ACPI Notify on TBT Hot-plug (Disabled) (00) (Keep Enabled if u use thunderbolt devices)
rem Intel RMT State (Disabled) (00)
rem PCI Delay Optimization (Enabled) (01)
rem System Acceleration with Intel(R) Optane(TM) Memory (Enabled) (01)
rem Disable Gen2 Pll Shutdown and L1 Controller Power gating (Disabled) (00)
rem Energy Performance Gain (Enabled) (01)
rem Package Power Limit MSR Lock (Disabled) (00)
rem TDC Lock (Enabled) (01)
rem CFG Lock (Disabled) (00)
rem Overclocking Lock (Disabled) (00)
rem Interrupt Redirection Mode Selection (Fixed Priority) (00)

::New Additions
rem Snoop Latency Override (Auto) (02): - (Auto) (02) Enables automatic snooping latency adjustment based on system conditions, (Disable) (00) Turns off snooping, which can improve performance in certain scenarios but may lead to memory consistency issues.
rem Non Snoop Latency Multiplier (32 ns) (01) - Performance: Set to 32 ns (lower latency) (01), Stability: Set to 1024 ns (better throghput scenarios performance like video rendering) (02)
rem URR (Uncore Reduction Ratio): A feature that reduces power consumption by limiting the performance of uncore components (e.g., memory controllers, PCIe links) when the system is idle or under low load.
rem FER (Fixed Energy Range): A power management feature that limits the maximum power consumption of a system or component to a predefined level, ensuring a fixed energy range.
rem NFER (Native Energy Range): Similar to FER, but allows the system to dynamically adjust power consumption based on workload demands, while still maintaining a predetermined energy range.
rem CER (Configurable Energy Range): An advanced power management feature that allows users to configure and set custom energy ranges (power limits) for their system or components, providing fine-grained control over power consumption and performance.
rem CTO (Configurable TDP Offset): A feature that allows users to adjust the Thermal Design Power (TDP) limit of a processor, effectively increasing or decreasing its power consumption and heat generation. This can help balance performance and thermal requirements.
rem SEFE (Smart Energy Feedback and Efficiency): A technology that monitors and optimizes system power consumption, thermal performance, and energy efficiency. It uses advanced algorithms to analyze system behavior, predict energy demands, and adjust power settings to minimize waste and reduce energy consumption.
rem SENFE (Smart Energy Notification and Feedback Engine): A feature that monitors system energy usage and provides feedback to help optimize power consumption and efficiency.
rem SECE (Smart Energy Conservation Engine): A technology that dynamically adjusts system power settings to minimize energy waste and reduce consumption, based on usage patterns and system requirements.

::Comment
rem I am not too excited about it but I want anyone know all settings work but not for all BIOS. If someone read one BIOS he/she can find there are little common between bios settings. 
rem Although these are main and found common and if some settings not work dont worry they are skipped. 

call C:\Windows\TEMP\RunAsTI.cmd "%~f0" %*

FOR /F %%A in ('"PROMPT $H&FOR %%B in (1) DO REM"') DO SET "BS=%%A"
for /f "tokens=2 delims==" %%a in ('wmic cpu get manufacturer /value ^| find "Manufacturer"') do (
    set "ProcessorManufacturer=%%a"
)
if /i "%ProcessorManufacturer%" EQU "GenuineIntel" (
    goto :Intel
) else if /i "%ProcessorManufacturer%" EQU "AuthenticAMD" (
    goto :AMD
) else (
    goto :go
)


:Intel
cls
echo do not close it adding tweaks
timeout /T 2 /NOBREAK >NUL
SCEWIN_64.exe /i /lang en-US /ms "ACPI Notify on TBT Hot-plug" /qv 0x00 
SCEWIN_64.exe /i /lang en-US /ms "ACPI Standby State" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "ACPI T-States" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "ALS Support" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "AP threads Idle Manner" /qv 0x03 
SCEWIN_64.exe /i /lang en-US /ms "ARI Forwarding" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "ASPM" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "BCLK Aware Adaptive Voltage" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "Bi-directional PROCHOT#" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "BIOS Hot-Plug Support" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "BIOS Lock" /qv 0x00 
SCEWIN_64.exe /i /lang en-US /ms "BIST Enable" /qv 0x00 
SCEWIN_64.exe /i /lang en-US /ms "Bluetooth Sideband" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "BME DMA Mitigation" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "Boot performance mode" /qv 0x02 
SCEWIN_64.exe /i /lang en-US /ms "BT Intel A2DP" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "BT Intel HFP" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "C6DRAM" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "CER" /qv 0x01 
SCEWIN_64.exe /i /lang en-US /ms "CFG Lock" /qv 0x00 
SCEWIN_64.exe /i /lang en-US /ms "CHAP Device (B0:D7:F0)" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "Clock Power Management" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "CPU Attached Storage" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "Cpu CrashLog (Device 10)" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "CPU PkgC10 Long Sleep" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "CPU Run Control Lock" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "CPU Run Control" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "CPU Wakeup Timer" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "CrashLog Feature" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "DeepSx Power Policies" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "DeepSx Wake on WLAN and BT Enable" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "Disable DSX ACPRESENT PullDown" /qv 0x1 
SCEWIN_64.exe /i /lang en-US /ms "Disable Fast PKG C State Ramp for IA Domain" /qv 0x1 
SCEWIN_64.exe /i /lang en-US /ms "Disable Gen2 Pll Shutdown and L1 Controller Power gating" /qv 0x1
SCEWIN_64.exe /i /lang en-US /ms "DMI ASPM" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "DMI Gen3 ASPM" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "DMI Gen3 L1 Exit Latency" /qv 0x1 
SCEWIN_64.exe /i /lang en-US /ms "DMI Link ASPM Control" /qv 0x00 
SCEWIN_64.exe /i /lang en-US /ms "EC Low Power Mode" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "EC Notification" /qv 0x00 
SCEWIN_64.exe /i /lang en-US /ms "EC Turbo Control Mode" /qv 0x01 
SCEWIN_64.exe /i /lang en-US /ms "ECC Support" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "Enable 8254 Clock Gate" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "Enable ASPM" /qv 0x00 
SCEWIN_64.exe /i /lang en-US /ms "Enable DCI ModPHY Power Gate" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "Enable Display Audio Link in Pre-OS" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "Enable Hibernation" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "Enable LTR" /qv 0x00 
SCEWIN_64.exe /i /lang en-US /ms "Enable Remote Platform Erase Feature" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "Enable RH Prevention" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "Enable TBT ASPM" /qv 0x00 
SCEWIN_64.exe /i /lang en-US /ms "Enable xdpclock" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "Enable/Disable IED (Intel Enhanced Debug)" /qv 0x0  
SCEWIN_64.exe /i /lang en-US /ms "Energy Efficient P-state" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "Energy Efficient Turbo" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "Energy Performance Gain" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "Enhance Port 80h LPC Decoding" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "Enhanced Thermal Velocity Boost" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "Extended Tag" /qv 0x1 
SCEWIN_64.exe /i /lang en-US /ms "FIVR Dynamic PM" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "FIVR Spread Spectrum" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "Foxville I225 Wake on LAN Support" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "GNA Device (B0:D8:F0)" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "GPIO Lock" /qv 0x00 
SCEWIN_64.exe /i /lang en-US /ms "Hardware Autonomous Speed" /qv 0x1 
SCEWIN_64.exe /i /lang en-US /ms "HDC Control" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "HDC Control" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "HDD Acoustic Mode" /qv 0xFE 
SCEWIN_64.exe /i /lang en-US /ms "High Precision Timer" /qv 0x01 
SCEWIN_64.exe /i /lang en-US /ms "HwP Autonomous EPP Grouping" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "HwP Autonomous Per Core P State" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "Hybrid Storage Detection and Configuration Mode" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "I/O Resources Padding" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "IGD VTD Enable" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "In-Band ECC Support" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "INT3400 Device" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "Intel Rapid Recovery Technology" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "Intel Ready Mode Technology" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "Intel RMT State" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "Intel Trusted Execution Technology" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "Intel(R) Optane(TM) Memory" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "Intel(R) Speed Shift Technology Interrupt Control" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "Intel(R) Turbo Boost Max Technology 3.0" /qv 0x1 
SCEWIN_64.exe /i /lang en-US /ms "Interrupt Redirection Mode Selection" /qv 0x00 
SCEWIN_64.exe /i /lang en-US /ms "IOAPIC 24-119 Entries" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "IOP VTD Enable" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "IOTG Spread Spectrum" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "IPU Device (B0:D5:F0)" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "IPU VTD Enable" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "Ipv4 PXE Support" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "Ipv6 PXE Support" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "ITBT RTD3" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "JTAG C10 Power Gate" /qv 0x1 
SCEWIN_64.exe /i /lang en-US /ms "KT Device" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "LAN Option ROM" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "LAN Wake From DeepSx" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "Launch PXE OpROM policy" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "Legacy IO Low Latency" /qv 0x1 
SCEWIN_64.exe /i /lang en-US /ms "Legacy UART" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "LPM S0i2.0" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "LPM S0i2.1" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "LPM S0i2.2" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "LPM S0i3.0" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "LPM S0i3.1" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "LPM S0i3.2" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "LPM S0i3.3" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "LPM S0i3.4" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "LPMode" /qv 0x2
SCEWIN_64.exe /i /lang en-US /ms "LTR Mechanism Enable" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "Maximum Payload" /qv 0x5 
SCEWIN_64.exe /i /lang en-US /ms "Maximum Read Request" /qv 0x5 
SCEWIN_64.exe /i /lang en-US /ms "MMIO 32 bit Resources Padding" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "Modern StandBy" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "MRC Serial Debug Messages" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "MSI enabled" /qv 0x01 
SCEWIN_64.exe /i /lang en-US /ms "Native ASPM" /qv 0x00 
SCEWIN_64.exe /i /lang en-US /ms "NFER" /qv 0x00 
SCEWIN_64.exe /i /lang en-US /ms "Option ROM Messages" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "OS IDLE Mode" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "Overclocking Lock" /qv 0x00 
SCEWIN_64.exe /i /lang en-US /ms "Package Power Limit MSR Lock" /qv 0x00 
SCEWIN_64.exe /i /lang en-US /ms "PAVP Enable" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "PCH Cross Throttling" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "PCI Buses Padding" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "PCI Delay Optimization" /qv 0x01 
SCEWIN_64.exe /i /lang en-US /ms "PCI Express Clock Gating" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "Pcie Pll SSC" /qv 0xFE 
SCEWIN_64.exe /i /lang en-US /ms "PCIe Spread Spectrum Clocking" /qv 0x1 
SCEWIN_64.exe /i /lang en-US /ms "PCIE Spread Spectrum" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "PECI" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "PEG0 - ASPM" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "PEG0 Hotplug" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "PEG1 - ASPM" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "PEG1 Hotplug" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "PEG2 - ASPM" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "PEG2 Hotplug" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "PEP Audio" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "PEP CPU" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "PEP CSME" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "PEP EMMC" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "PEP enumerated SATA ports" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "PEP GNA" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "PEP Graphics" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "PEP HECI3" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "PEP I2C0" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "PEP I2C1" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "PEP I2C2" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "PEP I2C3" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "PEP I2C4" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "PEP I2C5" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "PEP I2C6" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "PEP I2C7" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "PEP IPU" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "PEP LAN(GBE)" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "PEP PCIe DG1" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "PEP PCIe GFX" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "PEP PCIe LAN" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "PEP PCIe Other" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "PEP PCIe Storage" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "PEP PCIe WLAN" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "PEP PEG0" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "PEP SATA" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "PEP SDXC" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "PEP SPI" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "PEP TBT RP" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "PEP TCSS" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "PEP THC0" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "PEP THC1" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "PEP UART" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "PEP VMD" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "PEP XHCI" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "Per Core P State OS control mode" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "PET Progress" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "PFMMIO 32 bit Resources Padding" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "Port 60/64 Emulation" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "Power Gating" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "Power Loss Notification Feature" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "Processor trace memory allocation" /qv 0xFF 
SCEWIN_64.exe /i /lang en-US /ms "PS_ON Enable" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "PS2 Keyboard and Mouse" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "P-state Capping" /qv 0x00 
SCEWIN_64.exe /i /lang en-US /ms "PUIS Enable" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "Race To Halt (RTH)" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "Race To Halt" /qv 0x00
SCEWIN_64.exe /i /lang en-US /ms "RAM" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "RC6(Render Standby)" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "RFI Spread Spectrum" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "RGB Light" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "Ring Down Bin" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "Row Hammer Mode" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "RTC Memory Lock" /qv 0x00 
SCEWIN_64.exe /i /lang en-US /ms "S0ix Auto Demotion" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "SECE" /qv 0x00 
SCEWIN_64.exe /i /lang en-US /ms "Serial Debug Messages" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "Serial IO UART" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "SLP_LAN# Low on DC Power" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "Smart Response Technology" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "SMM Use SMM en-US Indication" /qv 0x00 
SCEWIN_64.exe /i /lang en-US /ms "SR-IOV Support" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "SW Guard Extensions SGX" /qv 0x02 
SCEWIN_64.exe /i /lang en-US /ms "System Acceleration with Intel(R) Optane(TM) Memory" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "Tcc Offset Lock Enable" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "Tcc Offset Time Window" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "TDC Lock" /qv 0x01 
SCEWIN_64.exe /i /lang en-US /ms "Thermal Device (B0:D4:F0)" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "Thermal Velocity Boost" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "Three Strike Counter" /qv 0x1 
SCEWIN_64.exe /i /lang en-US /ms "Thunderbolt Boot Support" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "Thunderbolt Usb Support" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "Trace Hub" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "TVB Voltage Optimizations" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "Type C Support" /qv 0x2 
SCEWIN_64.exe /i /lang en-US /ms "URR" /qv 0x00 
SCEWIN_64.exe /i /lang en-US /ms "USB 2.0 Controller Mode" /qv 0x01 
SCEWIN_64.exe /i /lang en-US /ms "USB DbC Enable Mode" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "USB Overcurrent Override for DbC" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "USB S5 Wakeup Support" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "USB Standby Power at S4/S5" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "USB2 PHY Sus Well Power Gating" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "USB3 Type-C UFP2DFP Kernel/Platform Debug Support" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "USB3" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "VDD Enable" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "Vmax Stress" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "Voltage Optimization" /qv 0x00
SCEWIN_64.exe /i /lang en-US /ms "Wake From Thunderbolt(TM) Devices" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "Wake on LAN Enable" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "Wake on WLAN and BT Enable" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "WatchDog" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "WDT Enable" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "Windows 10 Thunderbolt support" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "WoV (Wake on Voice)" /qv 0x0 
SCEWIN_64.exe /i /lang en-US /ms "Snoop Latency Override" /qv 0x02 
SCEWIN_64.exe /i /lang en-US /ms "Non Snoop Latency Multiplier" /qv 0x01 
goto :Exit


:AMD
cls
echo do not close it adding tweaks
timeout /T 2 /NOBREAK >NUL
SCEWIN_64.exe /i /lang en-US /ms "ACPI Notify on TBT Hot-plug" /qv 0x00 
SCEWIN_64.exe /i /lang en-US /ms "AP threads Idle Manner" /qv 0x03 
SCEWIN_64.exe /i /lang en-US /ms "ASPM" /qv 0x00 
SCEWIN_64.exe /i /lang en-US /ms "BIOS Lock" /qv 0x00 
SCEWIN_64.exe /i /lang en-US /ms "BIST Enable" /qv 0x00 
SCEWIN_64.exe /i /lang en-US /ms "Boot performance mode" /qv 0x02 
SCEWIN_64.exe /i /lang en-US /ms "CER" /qv 0x01 
SCEWIN_64.exe /i /lang en-US /ms "CFG Lock" /qv 0x00 
SCEWIN_64.exe /i /lang en-US /ms "Disable Gen2 Pll Shutdown and L1 Controller Power gating" /qv 0x00 
SCEWIN_64.exe /i /lang en-US /ms "DMI Link ASPM Control" /qv 0x00 
SCEWIN_64.exe /i /lang en-US /ms "EC Notification" /qv 0x00 
SCEWIN_64.exe /i /lang en-US /ms "EC Turbo Control Mode" /qv 0x01 
SCEWIN_64.exe /i /lang en-US /ms "Enable ASPM" /qv 0x00 
SCEWIN_64.exe /i /lang en-US /ms "Enable LTR" /qv 0x00 
SCEWIN_64.exe /i /lang en-US /ms "Enable TBT ASPM" /qv 0x00 
SCEWIN_64.exe /i /lang en-US /ms "Energy Performance Gain" /qv 0x00 
SCEWIN_64.exe /i /lang en-US /ms "GPIO Lock" /qv 0x00 
SCEWIN_64.exe /i /lang en-US /ms "HDD Acoustic Mode" /qv 0xFE 
SCEWIN_64.exe /i /lang en-US /ms "High Precision Timer" /qv 0x01 
SCEWIN_64.exe /i /lang en-US /ms "Interrupt Redirection Mode Selection" /qv 0x00 
SCEWIN_64.exe /i /lang en-US /ms "MSI enabled" /qv 0x01 
SCEWIN_64.exe /i /lang en-US /ms "Native ASPM" /qv 0x00 
SCEWIN_64.exe /i /lang en-US /ms "NFER" /qv 0x00 
SCEWIN_64.exe /i /lang en-US /ms "Overclocking Lock" /qv 0x00 
SCEWIN_64.exe /i /lang en-US /ms "Package Power Limit MSR Lock" /qv 0x00 
SCEWIN_64.exe /i /lang en-US /ms "PCI Delay Optimization" /qv 0x01 
SCEWIN_64.exe /i /lang en-US /ms "PECI" /qv 0x00 
SCEWIN_64.exe /i /lang en-US /ms "P-state Capping" /qv 0x00 
SCEWIN_64.exe /i /lang en-US /ms "Race To Halt" /qv 0x00
SCEWIN_64.exe /i /lang en-US /ms "RTC Memory Lock" /qv 0x00 
SCEWIN_64.exe /i /lang en-US /ms "SECE" /qv 0x00 
SCEWIN_64.exe /i /lang en-US /ms "SEFE" /qv 0x00 
SCEWIN_64.exe /i /lang en-US /ms "SMM Use SMM en-US Indication" /qv 0x00 
SCEWIN_64.exe /i /lang en-US /ms "SW Guard Extensions SGX" /qv 0x02 
SCEWIN_64.exe /i /lang en-US /ms "System Acceleration with Intel(R) Optane(TM) Memory" /qv 0x01 
SCEWIN_64.exe /i /lang en-US /ms "TDC Lock" /qv 0x01 
SCEWIN_64.exe /i /lang en-US /ms "TVB Voltage Optimizations" /qv 0x00 
SCEWIN_64.exe /i /lang en-US /ms "URR" /qv 0x00 
SCEWIN_64.exe /i /lang en-US /ms "USB 2.0 Controller Mode" /qv 0x01 
SCEWIN_64.exe /i /lang en-US /ms "Voltage Optimization" /qv 0x00
SCEWIN_64.exe /i /lang en-US /ms "_OSC For PCI0" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "1TB remap" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "3-link xGMI max speed" /qv 0x13
SCEWIN_64.exe /i /lang en-US /ms "4-link xGMI max speed" /qv 0x13
SCEWIN_64.exe /i /lang en-US /ms "AB Clock Gating" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "ACP CLock Gating" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "ACP Power Gating" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "ACPI _CST C1 Declaration" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "ACPI Sleep State" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "ACPI SRAT L3 Cache As NUMA Domain" /qv 0x1
SCEWIN_64.exe /i /lang en-US /ms "ACPI Standby State" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "ACS Enable" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "Aggresive SATA Device Sleep Port 0" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "Aggresive SATA Device Sleep Port 1" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "ALink RAS Support" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "APBDIS" /qv 0x1
SCEWIN_64.exe /i /lang en-US /ms "ASPM Mode Control" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "ASPM Support" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "BME DMA Mitigation" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "Bootup NumLock State" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "CC1" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "CC6 memory region encryption" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "Chipset Power Saving Features" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "Core Watchdog Timer Enable" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "CPPC Preferred Cores" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "CPPC" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "CPU PCIE ASPM Mode Control" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "CV test" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "D3 Cold Support" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "D3Cold Support" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "Data Scramble" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "Debug Port Table" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "DF Cstates" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "Disable DF sync flood propagation" /qv 0x1
SCEWIN_64.exe /i /lang en-US /ms "Disable DF to external downstream IP SyncFloodPropagation" /qv 0x1
SCEWIN_64.exe /i /lang en-US /ms "DMA Protection" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "DMA Protection" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "DMAr Support" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "DRAM ECC Enable" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "DRAM Latency Enhance" /qv 0x1
SCEWIN_64.exe /i /lang en-US /ms "DRAM map inversion" /qv 0x1
SCEWIN_64.exe /i /lang en-US /ms "DRAM scrub time" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "DRAM UECC Retry" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "EHCI D3 Support" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "eMMC Boot" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "Enable AER Cap" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "Extended Tag" /qv 0x1
SCEWIN_64.exe /i /lang en-US /ms "Fixed SOC Pstate" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "Freeze DF module queues on error" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "Global C-state Control" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "GMI encryption control" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "I2C 0 D3 Support" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "I2C 1 D3 Support" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "I2C 2 D3 Support" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "I2C 3 D3 Support" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "I2C 4 D3 Support" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "I2C 5 D3 Support" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "Indirect Branch Prediction Speculation" /qv 0x1
SCEWIN_64.exe /i /lang en-US /ms "Integrated Graphics" /qv 0x1
SCEWIN_64.exe /i /lang en-US /ms "IOMMU" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "Ipv4 PXE Support" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "Ipv6 PXE Support" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "L1 Stream HW Prefetcher" /qv 0x1
SCEWIN_64.exe /i /lang en-US /ms "L2 Stream HW Prefetcher" /qv 0x1
SCEWIN_64.exe /i /lang en-US /ms "LCLK DPM Enhanced PCIe Detection" /qv 0x2
SCEWIN_64.exe /i /lang en-US /ms "LCLK DPM" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "LN2 Mode 1" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "Loopback Mode" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "Maximum Payload" /qv 0x5
SCEWIN_64.exe /i /lang en-US /ms "Maximum Read Request" /qv 0x5
SCEWIN_64.exe /i /lang en-US /ms "MCA error thresh enable" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "Modern Standby Type" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "NBIO Poison Consumption" /qv 0x2
SCEWIN_64.exe /i /lang en-US /ms "NBIO RAS Control" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "NBIO RAS Global Control" /qv 0x1
SCEWIN_64.exe /i /lang en-US /ms "NBIO SyncFlood Generation" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "OC Mode" /qv 0x3
SCEWIN_64.exe /i /lang en-US /ms "Onboard PCIE LAN PXE ROM" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "Option ROM Messages" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "Parallel Port" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "PCIe ARI Enumeration" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "PCIe ARI Support" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "PCIe Ten Bit Tag Support" /qv 0x1
SCEWIN_64.exe /i /lang en-US /ms "Periodic Directory Rinse" /qv 0x1
SCEWIN_64.exe /i /lang en-US /ms "Platform First Error Handling" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "PM L1 SS" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "Poison scrubber control" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "Power Down Enable" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "Power Supply Idle Control" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "PSPP Policy" /qv 0x1
SCEWIN_64.exe /i /lang en-US /ms "PSS Support" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "Redirect scrubber control" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "Remote Display Feature" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "S3/Modern Standby Support" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "SATA D3 Support" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "Sata RAS Support" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "SB C1E Support" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "SB Clock Spread Spectrum" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "SD D3 Support" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "Serial(COM) Port" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "SmartShift Enable" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "SMEE" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "SMT Control" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "SMU and PSP Debug" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "SoC/Uncore OC Mode" /qv 0x1
SCEWIN_64.exe /i /lang en-US /ms "Spread Spectrum" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "SR-IOV Support" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "SRIS" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "STAPM Boost" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "Streaming Stores Control" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "SVM Mode" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "System Hub Watchdog Timer" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "System probe filter" /qv 0x1
SCEWIN_64.exe /i /lang en-US /ms "TCM State" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "Thunderbolt Support" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "TPM State" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "TSME" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "Turn On LED in S5" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "UART 0 D3 Support" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "UART 1 D3 Support" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "UART 2 D3 Support" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "UART 3 D3 Support" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "USB ecc SMI Enable" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "USB Phy Power Down" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "VGA Palette Snoop" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "Wake on PME" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "xGMI encryption control" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "XHCI D3 Support" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "XHCI Hand-off" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "Xtrig7 Workaround" /qv 0x0
SCEWIN_64.exe /i /lang en-US /ms "Snoop Latency Override" /qv 0x02 
SCEWIN_64.exe /i /lang en-US /ms "Non Snoop Latency Multiplier" /qv 0x01 
goto :Exit


:go
echo  CPU not supported
timeout /T 2 /NOBREAK >NUL
goto :Exit


:Exit
exit