hackerrank - elearning - formation 2025 - Préparation 1-2Weeks

- Introduction
    
    Préparation à des tests d’HackerRank entre 1-2 semaines intensives → elearning - formation 2025 - Préparation 1-2Weeks-
    
- Sources et quelques réponses
    
    https://www.cyberciti.biz/faq/linux-unix-applesox-bsd-bash-cstyle-for-loop/
    
    https://cheat.sh/read
    
    `read -n 1 -e -p 'Prompt: ' choice`
    
    https://linuxize.com/post/bash-functions/
    
    https://www.it-connect.fr/script-bash-utiliser-conditions-if-else-et-elif/
    
    https://unix.stackexchange.com/questions/42968/bash-integer-expression-expected-using-read-test
    
    https://unix.stackexchange.com/questions/47584/in-a-bash-script-using-the-conditional-or-in-an-if-statement
    
    912
    
    If you want to say OR use double pipe (||).
    
    `if [ "$fname" = "a.txt" ] || [ "$fname" = "c.txt" ]`
    

===============

- **Ordi principal**
    
    ```yaml
    read x 
    read y 
    read z
    
    if [ $x == $y ] && [ $y == $z ] && [ $x == $z ] 
    then
        echo "EQUILATERAL"
        
    elif [ $x == $y ] || [ $x == $z ]
    then 
        echo "ISOCELES"
    elif [ $y == $x ] || [ $y == $z ]
    then 
        echo "ISOCELES"
    elif [ $z == $x ] || [ $y == $z ]
    then 
        echo "ISOCELES"
    else
        echo "SCALENE"
    fi 
    
    if [ $x == $y ] && [ $y == $z ] && [ $x == $z ] 
    then
        echo "EQUILATERAL"
        
    elif [ $x == $y ] || [ $x == $z ] || [ $y == $x ] || [ "$y" == "$z" ];
    then 
        echo "ISOCELES"
    else
        echo "SCALENE"
    fi 
    
    ==> lmarche mieux v2 ai en-dessous
    if [ "$x" -eq "$y" ] && [ "$y" -eq "$z" ]; then
        echo "EQUILATERAL"
    # Check for isosceles triangle
    elif [ "$x" -eq "$y" ] || [ "$x" -eq "$z" ] || [ "$y" -eq "$z" ]; then
        echo "ISOSCELES"
    # If neither, it must be scalene
    else
        echo "SCALENE"
    fi
    
    ====
    
    while read f
    do 
        echo "$f" | cut -c 3
    done
    
    while read f
    do 
        echo "$f" | cut -c 2,7
    done
    
    while read f
    do 
        echo "$f" | cut -c 2-7
    done
    cut -c -4
    
    while read f
    do 
        echo "$f" | cut -f 1,2,3
    done
    
    while read f
    do 
        echo "$f" | cut -c 13-100
       
    done
    
    while read f
    do 
        echo "$f" | cut -f 4 -d " "
       
    done
    while read f
    do 
        echo "$f" | cut -f 1-3 -d " "
       
    done
    while read f
    do 
        echo "$f" | cut -f 2-100
       
    done
    
    read f
    echo "$f" | cut -c 1-20
    
    head $f -c 20 
       
    
    sed -n 12,22\p $file 
    
    tail -n 20 $file
    tail -c 20 $file 
    
    tr "()" "[]" $file
    
    tr -d "[:lower:]" $file
    
    tr -s ' ' $file
    
    cat $file | sort 
    
    sort -r $file 
    sort -n $file 
    sort -nr $file 
    
    sort -t$'\t' -k2 -nr $file 
    sort -t$'\t' -k2 -n $file 
    sort -t$'|' -k2 -nr $file 
    
    Given a text file, remove the consecutive repetitions of any line.
    
    uniq $file
    
    uniq -c $file | sed 's/  / /g' | awk '{print $1, $2, $3}'
    cat $file | sed 's/  */ /g' | tr '[:upper:]' '[:lower:]' | uniq -c | awk '{print $1, $2, $3}'
    uniq -ic  | xargs -I{} printf "{}\n"
    uniq -u $file
    
    -i insensitive case 
    xargs.... to print it 
    
    tr '\n' '\t' $file 
    paste - - -
    
    paste -d ';' -s
    paste -d ';' - - -
    
    draft(){
    result=$(uniq -c $file  | awk '{print $1,'',$2,''}')
    result_final=${result::-1}
    echo "${result_final}"   
    }
    
    https://unix.stackexchange.com/questions/145978/replace-multiple-spaces-with-one-using-tr-only
    
    https://cheat.sh/tr
    
    https://cheat.sh/paste
    https://github.com/Thomas-George-T/HackerRank-The-Linux-Shell-Challenges-Solutions/blob/master/Challenges/Text%20Processing/Paste%20-%201.sh
    
    https://www.geeksforgeeks.org/tr-command-in-unix-linux-with-examples/
    
    https://www.geeksforgeeks.org/shell-script-to-displays-all-the-lines-between-the-given-line-numbers/
       
       
    ```
    

- **ordi Chhiny**
    
    ```jsx
    The result which operation contains all pairs of tuples from the two relations, regardless of whether their attribute values match. => cartesian product
    
    puts doc.elements.each("collection/movie/popularity/text()")
    
    https://web.archive.org/web/20240626101816/https://edutechwiki.unige.ch/en/XPath_tutorial_-_basics
    
    https://www.lambdatest.com/blog/complete-guide-for-using-xpath-in-selenium-with-examples/
    
    https://www.w3schools.com/python/python_conditions.asp
    
    puts doc.elements.each("collection/movie[popularity <8]/format/text()")
    
    puts doc.elements["collection/movie[@title='Trigun']/popularity/text()"]
    
    puts doc.elements["collection/movie[@title='Transformers']/@shelf"]
    
    if __name__ == '__main__':
        a = int(input())
        b = int(input())
    
        c=a/b
        print(int(c))
        print(float(c))
    
    SELECT * FROM CITY
    WHERE COUNTRYCODE = "USA" AND POPULATION > 100000 ;
    
    SELECT NAME FROM CITY
    WHERE POPULATION > 120000 AND COUNTRYCODE="USA";
    
    SELECT * FROM CITY ;
    SELECT * FROM CITY WHERE ID=1661 ;
    
    SELECT * FROM CITY WHERE COUNTRYCODE='JPN' ;
    
    SELECT NAME FROM CITY WHERE COUNTRYCODE="JPN" ;
    
    SELECT NAME FROM CITY WHERE COUNTRYCODE="JPN" ;
    SELECT CITY, STATE FROM STATION ;
    
    SELECT DISTINCT CITY FROM STATION
    WHERE MOD(ID,2)=0;
    
    SELECT COUNT(CITY) - COUNT(DISTINCT CITY) FROM STATION ;
    
    select city, length(city) from station
    where
    length(city) = (
    select max(length(city)) from station )
    order by city ASC limit 1;
    
    select city, length(city) from station
    where
    length(city) = (
    select min(length(city)) from station)
    order by city ASC limit 1;
    
    SELECT DISTINCT CITY
    FROM STATION
    WHERE CITY LIKE 'A%' OR
          CITY LIKE 'E%' OR
          CITY LIKE 'I%' OR
          CITY LIKE 'O%' OR
          CITY LIKE 'U%';
    
    SELECT CITY.NAME
    FROM CITY
    INNER JOIN COUNTRY ON CITY.CountryCode = COUNTRY.Code
    WHERE COUNTRY.Continent='Africa' ;
    
    SELECT COUNTRY.Continent, FLOOR(AVG(CITY.Population))
    FROM CITY
    INNER JOIN COUNTRY ON CITY.CountryCode = COUNTRY.Code
    GROUP BY COUNTRY.Continent ;
    
    SELECT DISTINCT CITY
    FROM STATION
    WHERE CITY NOT LIKE 'A%'
      AND CITY NOT LIKE 'E%'
      AND CITY NOT LIKE 'I%'
      AND CITY NOT LIKE 'O%'
      AND CITY NOT LIKE 'U%'
      AND CITY NOT LIKE 'a%'
      AND CITY NOT LIKE 'e%'
      AND CITY NOT LIKE 'i%'
      AND CITY NOT LIKE 'o%'
      AND CITY NOT LIKE 'u%' ;
    
    https://sql.sh/fonctions/length
    
    https://docs.aws.amazon.com/fr_fr/clean-rooms/latest/sql-reference/sum-function.html
    https://devhints.io/mysql
    https://www.datacamp.com/doc/mysql/mysql-mod
    
    def is_leap(year):
        leap = False
        check_leap = year % 4
        if year % 4 == 0 :
            leap = True
            if year % 100 == 0  :
                leap = False
            if year % 400 == 0 :
                leap  = True
        else :
            leap = False
    
        return leap
    
    year = int(input())
    print(is_leap(year))
    
    // Print the list of integers from  through  as a string, without spaces. 123 n = 3
    if __name__ == '__main__':
        n = int(input())
        a=""
        i=1
        for  i in range(i,n+1) :
           a+=str(i)
        print(a)
    
    // print what's your name
    #
    # Complete the 'print_full_name' function below.
    #
    # The function is expected to return a STRING.
    # The function accepts following parameters:
    #  1. STRING first
    #  2. STRING last
    #
    
    def print_full_name(first, last):
        print(f"Hello {first} {last}! You just delved into python.")
    if __name__ == '__main__':
        first_name = input()
        last_name = input()
        print_full_name(first_name, last_name)
    
    draft(){
    
    }
    
    draft_below(){
    
    #!/bin/python3
    
    import math
    import os
    import random
    import re
    import sys
    
    if __name__ == '__main__':
        n = int(input().strip())
        if n % 2 != 0 :
            print("Weird")
        elif n % 2 == 0 and n >= 2 and n < 5:
            print("Not Weird")
        elif n % 2 == 0 and n >= 6 and n < 20:
            print("Not Weird")
        else:
         print("Not Weird")
    
    }
    
    HackerRank est une plateforme populaire pour pratiquer des compétences en programmation et en bases de données, y compris SQL. Voici un aperçu des bases de SQL que vous devez connaître pour réussir sur HackerRank :
    
    ### 1. **Introduction à SQL**
    SQL (Structured Query Language) est un langage standard utilisé pour interagir avec des bases de données relationnelles. Il permet de créer, lire, mettre à jour et supprimer des données.
    
    ### 2. **Les opérations de base**
    - **SELECT** : Utilisé pour récupérer des données d'une ou plusieurs tables.
      ```sql
      SELECT column1, column2 FROM table_name;
      ```
    
    - **WHERE** : Filtre les résultats en fonction de conditions spécifiques.
      ```sql
      SELECT column1 FROM table_name WHERE condition;
      ```
    
    - **ORDER BY** : Trie les résultats par une ou plusieurs colonnes.
      ```sql
      SELECT column1 FROM table_name ORDER BY column1 ASC|DESC;
      ```
    
    - **LIMIT** : Limite le nombre de résultats retournés.
      ```sql
      SELECT column1 FROM table_name LIMIT number;
      ```
    
    ### 3. **Fonctions d'agrégation**
    - **COUNT()** : Compte le nombre de lignes.
    - **SUM()** : Calcule la somme d'une colonne.
    - **AVG()** : Calcule la moyenne d'une colonne.
    - **MIN()** et **MAX()** : Trouvent les valeurs minimales et maximales.
    
    Exemple :
    ```sql
    SELECT COUNT(*) FROM table_name WHERE condition;
    ```
    
    ### 4. **GROUP BY**
    Utilisé avec des fonctions d'agrégation pour regrouper les résultats par une ou plusieurs colonnes.
    ```sql
    SELECT column1, COUNT(*) FROM table_name GROUP BY column1;
    ```
    
    ### 5. **JOINs**
    Les jointures permettent de combiner des lignes de deux ou plusieurs tables en fonction d'une condition de relation.
    - **INNER JOIN** : Retourne les lignes qui ont des correspondances dans les deux tables.
    - **LEFT JOIN** (ou **LEFT OUTER JOIN**) : Retourne toutes les lignes de la table de gauche et les lignes correspondantes de la table de droite.
    - **RIGHT JOIN** (ou **RIGHT OUTER JOIN**) : Retourne toutes les lignes de la table de droite et les lignes correspondantes de la table de gauche.
    - **FULL JOIN** (ou **FULL OUTER JOIN**) : Retourne toutes les lignes lorsque qu'il y a une correspondance dans une des tables.
    
    Exemple d'INNER JOIN :
    ```sql
    SELECT a.column1, b.column2
    FROM table_a a
    INNER JOIN table_b b ON a.common_column = b.common_column;
    ```
    
    ### 6. **Sous-requêtes**
    Une sous-requête est une requête imbriquée dans une autre requête. Elle peut être utilisée dans les clauses SELECT, WHERE ou FROM.
    ```sql
    SELECT column1 FROM table_name WHERE column2 IN (SELECT column2 FROM another_table);
    ```
    
    ### 7. **Manipulation de données**
    - **INSERT** : Ajoute de nouvelles lignes dans une table.
      ```sql
      INSERT INTO table_name (column1, column2) VALUES (value1, value2);
      ```
    
    - **UPDATE** : Modifie des lignes existantes.
      ```sql
      UPDATE table_name SET column1 = value1 WHERE condition;
      ```
    
    - **DELETE** : Supprime des lignes.
      ```sql
      DELETE FROM table_name WHERE condition;
      ```
    
    ### 8. **Fonctions de chaîne et de date**
    SQL propose également des fonctions pour manipuler des chaînes de caractères et des dates, comme `CONCAT()`, `SUBSTRING()`, `NOW()`, `DATE_FORMAT()`, etc.
    
    ### 9. **Index et performances**
    Les index améliorent la vitesse des opérations de recherche dans une base de données. Comprendre comment et quand utiliser des index peut être crucial pour optimiser les performances.
    
    ### 10. **Pratique sur HackerRank**
    - **Résoudre des problèmes** : HackerRank propose de nombreux défis SQL. Commencez par les problèmes de niveau débutant et progressez vers des niveaux plus avancés.
    - **Lire les instructions attentivement** : Chaque défi a des spécifications précises. Assurez-vous de bien comprendre ce qui est demandé.
    - **Tester vos requêtes** : Utilisez l'éditeur de requêtes de HackerRank pour tester vos solutions avant de les soumettre.
    
    En vous familiarisant avec ces concepts et en pratiquant régulièrement, vous serez bien préparé pour les défis SQL sur HackerRank. Bonne chance !
    
    ```
    

- ordi du boulot
    
    
    ```json
    training-hackerrank-05-05-2025.md
    
    declare -a array=()
    
    while read f 
    do 
        #echo "$f"
        array+=("$f")
    done 
    
    echo "${array[@]}"
    
    // slicing an array 
    
    declare -a array=()
    
    while read f 
    do 
        #echo "$f"
        array+=("$f")
    done 
    
    echo "${array[@]:3:5}"
    
    https://www.geeksforgeeks.org/bash-scripting-array/
    https://ioflood.com/blog/bash-append-to-array/#:~:text=The%20most%20straightforward%20way%20to,the%20end%20of%20an%20array.&text=In%20this%20example%2C%20we%20start%20with%20an%20array%20fruits%20containing,%27%2C%20and%20%27Cherry%27.
    
    https://www.thegeekstuff.com/2010/06/bash-array-tutorial/
    ```