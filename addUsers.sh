#! /bin/bash


for nom in "$@"; do
    if [ -z "$nom" ]; then
        echo "Il manque les noms d'utilisateurs en argument - Fin du script"
        exit 1
    fi

    if cat /etc/passwd | grep "^$nom:" > /dev/null; then
        echo "L'utilisateur $nom existe déjà."
    else
        if useradd --force-badname "$nom"; then
            echo "L'utilisateur $nom a été créé."
        else
            echo "Erreur à la création de l'utilisateur $nom."
        fi
    fi
done
