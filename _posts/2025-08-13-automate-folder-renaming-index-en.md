---
layout: post
title:  "Automate Folder Renaming with Numeric Index in PowerShell and Bash"
date:   2025-08-13 12:00:00 +0200
filename: "2025-08-13-automate-folder-renaming-index.md"
description: "Learn how to automate folder renaming by adding a numeric index in PowerShell and Bash, while handling spaces and special characters. Perfect for organizing projects or data migrations."
categories: [scripting, automation]
tags: [powershell, bash, script, file-management, tips]
---

## Introduction

When managing a large number of folders, it’s often useful to prefix them with a numeric index for sorting or organization. This article explains how to add a numeric index (e.g., `1-`, `2-`, etc.) to folder names **only if they don’t already start with a number followed by a hyphen**, while handling spaces and special characters. The solutions work in **PowerShell** (Windows) and **Bash** (Linux/macOS).

---

## Prerequisites

- A PowerShell or Bash terminal, depending on your system.
- Permissions to rename folders in the target directory.

---

## PowerShell Solution

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

### Explanation:
- **`Get-ChildItem -Directory`**: Lists only directories in the current folder.
- **`-notmatch '^\d+-'`**: Checks if the folder name does not start with one or more digits followed by a hyphen.
- **`$index`**: A variable incremented after each rename to ensure a unique index.
- **`-Force`**: Handles folder names with spaces or special characters.

---

## Bash Solution

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

### Explanation:
- **`*/`**: Loops through directories in the current folder.
- **`${dir%/}`**: Removes the trailing `/` from the directory name.
- **`[[ ! "$dir" =~ ^[0-9]+- ]]`**: Checks if the name does not start with a number followed by a hyphen.
- **`--`**: Protects against folder names with spaces or special characters.
- **`((index++))`**: Increments the index after each rename.

---

## Example Results

| Original Folder Name | Renamed Folder Name |
|----------------------|---------------------|
| `folder1`            | `1-folder1`         |
| `project-archive`    | `2-project-archive` |
| `documents_2024`     | `3-documents_2024`  |
| `temp_files`         | `4-temp_files`      |
| `important-data`     | `5-important-data`  |
| `123-old`            | *unchanged*         |

---

## Use Cases

- **Project Organization**: Prefix folders for chronological or priority sorting.
- **Data Migration**: Standardize folder names before importing.
- **Automation**: Integrate this script into a larger workflow.

---

## Notes

- **Backup your data** before running a bulk rename script.
- **Test the script** on a small set of folders before applying it widely.
- To start the index at a different number, change the initial value of `$index` or `index`.

---

## Conclusion

These scripts save time and prevent manual errors when renaming folders. They are easily adaptable for specific needs, such as custom prefixes or different increments.

Feel free to share your own tips in the comments!  


This article has been generated with Mistral.ai.
