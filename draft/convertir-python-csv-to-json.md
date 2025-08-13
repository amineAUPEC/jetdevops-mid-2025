# Convertir un fichier JSON ou CSV en python
Dans cet article, la magie opère pour transformer vos fichiers python en CSV ou en JSON. 
# Définitions 
    - CSV : Comma separated Values est le fichier de base des données recueillies - sans formatage particulier. Chaque champ est séparé par une virgule.
    - JSON : Javascript Object Notation est un standard permettant le traitement en général par un programme ou une machine. 
> [!NOTE]
> Souvent en JavaScript les fichiers JSON sont + simples à générer. 
> Souvent avec Excel il est plus courant d'utiliser du XSLX ou du CSV, le CSV est aussi facilement traitable avec un fichier en texte brut et aussi avec des langages de scripting comme PowerShell ou Bash(sous Linux). 
# Examples de fichiers 
## Examples de fichiers CSV séparés par une virgule : search-engine.csv 

```dotnetcli
url,description,mail
www.google.fr,google we are happy to collect your data,google@contact.com
www.bing.fr,bing the best search engine,bing.support.fr@outlook.com
```

## Examples de fichiers CSV séparés par un point-virgule : search-engine-semicolon.csv

```dotnetcli
url;description;mail
www.google.fr;google we are happy, to collect your data;google@contact.com
www.bing.fr;bing the best search engine;bing.support.fr@outlook.com
```

> [!WARNING]
> Comme vous l'avez constaté si vous avez des virgules dans la colonne description il sera plus simple d'utiliser un point-virgule
# Examples de fichiers JSON : demo-json.json 

```json
[
    {
        "name": "Adeel Solangi",
        "language": "Sindhi",
        "id": "V59OF92YF627HFY0",
        "bio": "Donec lobortis eleifend condimentum. Cras dictum dolor lacinia lectus vehicula rutrum. Maecenas quis nisi nunc. Nam tristique feugiat est vitae mollis. Maecenas quis nisi nunc.",
        "version": 6.1
    },
    {
        "name": "Afzal Ghaffar",
        "language": "Sindhi",
        "id": "ENTOCR13RSCLZ6KU",
        "bio": "Aliquam sollicitudin ante ligula, eget malesuada nibh efficitur et. Pellentesque massa sem, scelerisque sit amet odio id, cursus tempor urna. Etiam congue dignissim volutpat. Vestibulum pharetra libero et velit gravida euismod.",
        "version": 1.88
    },
    {
        "name": "Aamir Solangi",
        "language": "Sindhi",
        "id": "IAKPO3R4761JDRVG",
        "bio": "Vestibulum pharetra libero et velit gravida euismod. Quisque mauris ligula, efficitur porttitor sodales ac, lacinia non ex. Fusce eu ultrices elit, vel posuere neque.",
        "version": 7.27
    }
]
```
> [!WARNING]
> Faites bien attention àn ne pas avoir d'erreur de syntaxe comme la dernière accolade sans la virgule

Sources : https://microsoftedge.github.io/Demos/json-dummy-data/64KB-min.json
# Convertir un fichier CSV en JSON en python 
> [!WARNING]
> Ce script minimaliste ne fonctionne que pour le séparateur virgule
- **csv-to-json.py**
```python
import csv
import json

input_csv_file = 'search-engine.csv'
output_json_file = 'search-engine-output.json'

with open(input_csv_file, 'r') as file:
    csv_data = csv.DictReader(file)
    # Conversion en liste de dict
    output_data = list(csv_data)

with open(output_json_file, 'w') as file:
    json.dump(output_data,file, indent=6)
```
## Résultats 
- Voici le fichier JSON généré
- **search-engine-output.json**
```json
[
      {
            "url": "www.google.fr",
            "description": "google we are happy to collect your data",
            "mail": "google@contact.com"
      },
      {
            "url": "www.bing.fr",
            "description": "bing the best search engine",
            "mail": "bing.support.fr@outlook.com"
      }
]
```

 
# Convertir un fichier JSON en CSV en python

- **json-to-csv.py**
```python
import csv
import json

input_json_file = 'demo-json.json'
output_csv_file = 'demo-output-csv.csv'

with open(input_json_file, 'r') as json_file:
    data = json.load(json_file)

with open(output_csv_file, 'w', newline='') as csv_file:
    writer = csv.writer(csv_file)

    # Écriture des en-têtes du CSV
    writer.writerow(data[0].keys())

    # Écriture des données du JSON dans le CSV
    writer.writerows(item.values() for item in data)
```

## Résultats 

```dotnetcli
name,language,id,bio,version
Adeel Solangi,Sindhi,V59OF92YF627HFY0,Donec lobortis eleifend condimentum. Cras dictum dolor lacinia lectus vehicula rutrum. Maecenas quis nisi nunc. Nam tristique feugiat est vitae mollis. Maecenas quis nisi nunc.,6.1
Afzal Ghaffar,Sindhi,ENTOCR13RSCLZ6KU,"Aliquam sollicitudin ante ligula, eget malesuada nibh efficitur et. Pellentesque massa sem, scelerisque sit amet odio id, cursus tempor urna. Etiam congue dignissim volutpat. Vestibulum pharetra libero et velit gravida euismod.",1.88
Aamir Solangi,Sindhi,IAKPO3R4761JDRVG,"Vestibulum pharetra libero et velit gravida euismod. Quisque mauris ligula, efficitur porttitor sodales ac, lacinia non ex. Fusce eu ultrices elit, vel posuere neque.",7.
27  
```


# Conclusion 
- Nous avons vu les bases de la convertion entre un fichier CSV / JSON

- En cas de problème veuillez me le remonter 
- N'hésitez pas à laisser un commentaire sur Disqus

# Sources : 
- https://www.bibl.ulaval.ca/geostat/statistiques/CSV-guide.pdf
- https://microsoftedge.github.io/Demos/json-dummy-data/64KB-min.json
