---
layout: post
title:  "Automatiser le renommage de fichiers avec PowerShell et Bash"
date:   2025-08-13 12:00:00 +0200
categories: [scripting, automatisation]
tags: [powershell, bash, script, renommage, fichiers, automatisation, windows, linux]
description: "Automatiser le renommage de fichiers avec PowerShell et Bash terminal-friendly"
filename: "2025-08-13-renommer-fichiers-powershell-bash-terminal-friendly.md"
---

# Automatiser le renommage de fichiers avec PowerShell et Bash

Le renommage de fichiers en masse est une tâche courante pour les administrateurs système, les développeurs ou toute personne gérant un grand nombre de documents. Cet article présente deux scripts — l’un en **PowerShell** pour Windows, l’autre en **Bash** pour Linux/macOS — qui permettent de standardiser les noms de fichiers en remplaçant les espaces, les apostrophes et les motifs numérotés entre parenthèses.

Ces scripts sont conçus pour :
- Remplacer les **espaces** et les **apostrophes** par des underscores (`_`), en limitant à deux underscores consécutifs maximum.
- Remplacer les motifs `(1)`, `(2)`, etc., par `-1`, `-2`, etc.

---

## Pourquoi automatiser le renommage de fichiers ?

Que ce soit pour préparer des fichiers avant un archivage, une synchronisation ou un traitement automatique, il est souvent nécessaire de normaliser les noms de fichiers. Par exemple, les noms de fichiers contenant des espaces ou des caractères spéciaux peuvent poser problème lors de l’utilisation de certains outils ou scripts.

---

## Script PowerShell (Windows)

Voici un script PowerShell qui permet de renommer automatiquement les fichiers selon les règles définies :

```powershell
# Script PowerShell pour renommer les fichiers selon les règles spécifiées

$files = Get-ChildItem -File

foreach ($file in $files) {
    $newName = $file.Name

    # Remplacer les apostrophes et espaces par un underscore, en limitant à deux underscores consécutifs
    $newName = $newName -replace "'", "_"
    $newName = $newName -replace '\s+', '_'
    $newName = $newName -replace '_{2,}', '__'

    # Remplacer (1) par -1, (2) par -2, etc.
    $newName = $newName -replace '\(\s*(\d+)\s*\)', '-$1'

    # Gestion des chemins longs (utilisation de \\?\)
    $sourcePath = "\\?\" + $file.FullName
    $destPath = "\\?\" + (Join-Path $file.DirectoryName $newName)

    if ($newName -ne $file.Name) {
        try {
            Rename-Item -Path $sourcePath -NewName $newName -Force -ErrorAction Stop
            Write-Host "Renommé : $($file.Name) -> $newName"
        }
        catch {
            Write-Host "Erreur lors du renommage de $($file.Name) : $_"
        }
    }
}
```

**Fonctionnalités :**
- Remplace les apostrophes et espaces par des underscores.
- Gère les chemins longs sous Windows grâce à `\\?\`.
- Affiche un message en cas d’erreur.

---

## Script Bash (Linux/macOS)

Pour les utilisateurs de Linux ou macOS, voici un script Bash qui réalise les mêmes opérations :

```bash
#!/bin/bash

for file in *; do
    if [ -f "$file" ]; then
        newName="$file"
        # Remplacer les apostrophes et espaces par un underscore, en limitant à deux underscores consécutifs
        newName=$(echo "$newName" | sed "s/'/_/g; s/[[:space:]]\+/_/g; s/__\+/__/g")
        # Remplacer (1) par -1, (2) par -2, etc.
        newName=$(echo "$newName" | sed -E "s/\(([[:space:]]*)([0-9]+)([[:space:]]*)\)/-\2/g")
        if [ "$newName" != "$file" ]; then
            mv -v -- "$file" "$newName"
        fi
    fi
done
```

**Fonctionnalités :**
- Utilise `sed` pour effectuer les substitutions.
- Compatible avec les systèmes Unix (Linux, macOS).
- Affiche les fichiers renommés.

---

## Exemples de transformation

Voici quelques exemples de noms de fichiers avant et après l’exécution des scripts :

| Fichier original                | Fichier renommé                  |
|----------------------------------|-----------------------------------|
| `Document important (1).pdf`     | `Document_important-1.pdf`        |
| `L'exemple (2).docx`             | `L_exemple-2.docx`                |
| `Rapport final v3 (10).txt`      | `Rapport_final_v3-10.txt`         |

---

## Conseils d’utilisation

1. **Testez toujours le script sur une copie** de vos fichiers avant de l’appliquer aux originaux.
2. Sous Windows, si les chemins sont très longs, placez les fichiers dans un dossier proche de la racine (ex: `C:\temp\`).
3. Pour exécuter le script Bash, donnez-lui les droits d’exécution avec la commande :
   ```bash
   chmod +x renommer.sh
   ./renommer.sh
   ```
4. Pour exécuter le script PowerShell, ouvrez une session PowerShell et lancez-le (en tant qu’administrateur si nécessaire).

---

## Conclusion

Ces scripts permettent d’automatiser le nettoyage des noms de fichiers, une tâche qui peut être fastidieuse si elle est effectuée manuellement. Ils sont facilement adaptables pour répondre à d’autres besoins spécifiques de renommage.

N’hésitez pas à modifier ces scripts selon vos besoins ou à les intégrer dans des workflows plus larges pour optimiser la gestion de vos fichiers.

