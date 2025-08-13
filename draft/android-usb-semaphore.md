# android-usb-semaphore.md
jfmimi: avec une clé USB3.0, transfert un film de 3Go en quelque minutes

pour ton message d 'erreur " le delai de temporisation du semaphore a échoué "
- le "sémaphore" ( sorte d'horloge interne ) sert à synchroniser plusieurs taches que windows doit effectuer
- le "sémaphore" fonctionne avec l'ordonnanceur qui donne la liste des taches à effectuer.
- l'ordonnanceur donne un certain temps à windows pour effectuer cette tache, c'est le sémaphore qui "chronometre" windows et dit quand il faut lancer la tache suivante.
- si windows n'a pas effectué cette tache dans le temps imparti, la tache suivante ne peut pas demarrer ... c'est ce qu'indique le sémaphore par ce message : "Le délai de temporisation de sémaphore a expiré" .
Sources : https://forums.commentcamarche.net/forum/affich-36768464-lenteur-envoi-fichiers-sur-cle-usb
