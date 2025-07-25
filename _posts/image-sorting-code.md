

- WARN : Potentially working code maybe it's not working 


- Images
    - Image - Extraction images  to folders  from name - works
        
        ```markdown
        #!/bin/bash
        
        # Parcourir tous les fichiers correspondant au format img-yyyymmdd.jpg
        for file in img-*.jpg; do
            # Extraire la date du nom de fichier
            date=$(echo $file | grep -oP 'img-\K\d{8}')
        
            # Extraire le mois et la date de la date complète
            month=${date:4:2}
            day=${date:6:2}
        
            # Vérifier si le dossier de destination pour cette date existe
            if [ -d "./mm/$month/$day-$month" ]; then
                # Déplacer le fichier dans le dossier de destination
                mv $file ./mm/$month/$day-$month/
            else
                # Créer le dossier de destination s'il n'existe pas
                mkdir -p ./mm/$month/$day-$month
                # Déplacer le fichier dans le dossier de destination
                mv $file ./mm/$month/$day-$month/
            fi
        done
        
        ```
