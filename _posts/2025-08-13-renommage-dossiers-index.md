---
layout: post
title:  "Automatiser le renommage de dossiers avec un index numérique en PowerShell et Bash"
date:   2025-08-13 12:00:00 +0200
filename: "2025-08-13-renommage-dossiers-index.md"
description: "Découvrez comment automatiser le renommage de dossiers en ajoutant un index numérique en PowerShell et Bash, tout en gérant les espaces et caractères spéciaux. Idéal pour organiser vos projets ou migrations de données."
categories: [scripting, automatisation]
tags: [powershell, bash, script, gestion de fichiers, astuces]
---


## Introduction

Lorsqu’on gère un grand nombre de dossiers, il est souvent utile de les préfixer par un numéro d’index pour les trier ou les organiser automatiquement. Cet article explique comment ajouter un index numérique (ex: `1-`, `2-`, etc.) aux noms de dossiers **uniquement si ceux-ci ne commencent pas déjà par un numéro suivi d’un tiret**, en tenant compte des espaces et des caractères spéciaux. Les solutions proposées fonctionnent sous **PowerShell** (Windows) et **Bash** (Linux/macOS).

---

## Prérequis

- Un terminal PowerShell ou Bash selon votre système.
- Les droits nécessaires pour renommer les dossiers dans le répertoire cible.

---

## Solution pour PowerShell

```powershell
$index = 1
Get-ChildItem -Directory | ForEach-Object {
    $name = $_.Name
    if ($name -notmatch '^\d+-') {
        $newName = "$index-$name"
        Rename-Item -Path $_.FullName -NewName $newName -Force
        $index++
    }
}
```

### Explications :
- **`Get-ChildItem -Directory`** : Liste uniquement les dossiers du répertoire courant.
- **`-notmatch '^\d+-'`** : Vérifie que le nom du dossier ne commence pas par un ou plusieurs chiffres suivis d’un tiret.
- **`$index`** : Variable incrémentée à chaque renommage pour assurer un index unique.
- **`-Force`** : Permet de gérer les noms de dossiers contenant des espaces ou des caractères spéciaux.

---

## Solution pour Bash

```bash
index=1
for dir in */; do
    dir=${dir%/}
    if [[ ! "$dir" =~ ^[0-9]+- ]]; then
        mv -- "$dir" "$index-$dir"
        ((index++))
    fi
done
```

### Explications :
- **`*/`** : Boucle sur les dossiers du répertoire courant.
- **`${dir%/}`** : Supprime le `/` final du nom du dossier.
- **`[[ ! "$dir" =~ ^[0-9]+- ]]`** : Vérifie que le nom ne commence pas par un numéro suivi d’un tiret.
- **`--`** : Protège contre les noms de dossiers contenant des espaces ou des caractères spéciaux.
- **`((index++))`** : Incrémente l’index après chaque renommage.

---

## Exemple de résultat

| Dossier d’origine       | Dossier renommé       |
|-------------------------|-----------------------|
| `dossier1`              | `1-dossier1`          |
| `archive-projet`        | `2-archive-projet`    |
| `documents_2024`        | `3-documents_2024`    |
| `fichiers_temp`         | `4-fichiers_temp`     |
| `data-important`        | `5-data-important`    |
| `123-ancien`            | *non modifié*         |

---

## Cas d’usage

- **Organisation de projets** : Préfixer des dossiers pour un tri chronologique ou prioritaire.
- **Migration de données** : Standardiser les noms de dossiers avant une importation.
- **Automatisation** : Intégrer ce script dans un workflow plus large.

---

## Remarques

- **Sauvegardez vos données** avant d’exécuter un script de renommage massif.
- **Testez le script** sur un petit jeu de dossiers avant de l’appliquer à grande échelle.
- Pour commencer l’index à un numéro différent, modifiez la valeur initiale de `$index` ou `index`.

---

## Conclusion

Ces scripts permettent de gagner du temps et d’éviter les erreurs manuelles lors du renommage de dossiers. Ils sont facilement adaptables pour répondre à des besoins spécifiques, comme un préfixe personnalisé ou un incrément différent.

N’hésitez pas à partager vos propres astuces en commentaire !
Cet article a été généré à l'aide de Mistral
