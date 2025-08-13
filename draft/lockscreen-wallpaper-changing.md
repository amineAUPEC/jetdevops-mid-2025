- Dans cet article on contournera une GPO à l'aide d'une délégation en tant qu'administrateur ou plus simplement nous sommes en mesure de changer de fond d'écran en ligne de commande ou d'automatiser ce changement de Wallpaper 

# Lockscreen change wallpaper via PowerShell  
- Open an admin PowerShell and type these commands

```powershell
$Key = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\PersonalizationCSP'
if (!(Test-Path -Path $Key)) {
   New-Item -Path $Key -Force | Out-Null
}
Set-ItemProperty -Path $Key -Name LockScreenImagePath -value "C:\Users\martin\Images\xperia.jpg"
```
