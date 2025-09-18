---
title: "Export USB Device Inserted on the PC W10"
date: 2025-09-18 15:46:55
categories: [usb, hardware, audit]
tags: [usb, serial, windows]
layout: post
---

Here’s a PowerShell script that gives you a **full list of all USB storage devices** that were ever connected to your Windows PC, including:

- **SerialNumber** (from registry)
- **DeviceName** (from registry FriendlyName, or Description)
- **Model** (when available – extracted from registry DeviceDesc string)


Copy and paste this into a PowerShell window (run as Administrator):

```powershell
Get-ChildItem -Path "HKLM:\SYSTEM\CurrentControlSet\Enum\USBSTOR" | ForEach-Object {
    $device = $_
    $deviceName = $device.PSChildName
    $device.GetSubKeyNames() | ForEach-Object {
        $serial = $_
        $keyPath = "$($device.PSPath)\$serial"
        $props = Get-ItemProperty -Path $keyPath -ErrorAction SilentlyContinue
        $friendlyName = $props.FriendlyName
        $deviceDesc = $props.DeviceDesc
        # Extract Model from DeviceDesc if exists (usually "USBSTOR\Disk&Ven_VENDOR&Prod_MODEL...")
        $model = $null
        if ($deviceDesc -match "Prod_(.*?)(;|$)") { $model = $matches[1] }
        [PSCustomObject]@{
            SerialNumber   = $serial
            DeviceName     = $friendlyName
            Model          = $model

        }
    }
} | Format-Table -AutoSize
```

**What each column means:**

- **SerialNumber**: The unique serial number of each USB device
- **DeviceName**: Friendly name (if Windows found one)

- Note: Export to CSV?  
Replace the last line with:
```powershell
} | Export-Csv "usb-devices-log.csv" -NoTypeInformation -Encoding UTF8
```


Thanks to Perplexity for helping me with this topic. 
