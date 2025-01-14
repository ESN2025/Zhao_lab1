# Zhao_lab1

## Introduction

Dans ce projet, nous allons concevoir conjointement un FPGA et un processeur Nios II softcore afin d’explorer les méthodes de conception collaboratives entre le matériel et le logiciel. Le projet est basé sur la carte de développement DE10-Lite et utilise l’outil de conception Quartus pour la réalisation. Grâce à cette approche, nous créerons un système minimaliste capable de régler la vitesse d’un chenillard à l’aide de deux interrupteurs et de démarrer le chenillard avec un bouton. Les interrupteurs (SW) intégrés à la carte seront instanciés comme des périphériques du Nios II, dont deux seront utilisés pour contrôler la vitesse du chenillard, offrant deux niveaux de vitesse différents. Ces fonctionnalités seront programmées en langage C. Ce projet a pour objectif de mieux comprendre les processus de conception combinant matériel et logiciel sur une plateforme FPGA, tout en se familiarisant avec le processeur Nios II, la configuration de ses périphériques et l’utilisation de l’outil Quartus.  

## Architecture du sytème
![alt text](llab1-1.png)
Le système est composé d’une architecture de base comprenant un processeur Nios II, une mémoire RAM, une horloge (Clock) et un port JTAG. À cette architecture de base s’ajoutent des périphériques supplémentaires, notamment un PIO de 8 bits pour les LEDs, un PIO de 2 bits pour les commutateurs (Switches) et un PIO de 1 bit pour le bouton .

## Platform Designer
Comme décrit précédemment, l’architecture comprend trois PIO : un PIO d’entrée de 1 bit pour le bouton-poussoir (BP), un PIO d’entrée de 2 bits pour les commutateurs (SW), et un PIO de sortie de 8 bits pour les LEDs.
![alt text](11.PNG)

## Quartus
Dans Quartus, nous rédigeons le fichier de haut niveau light.vhd et utilisons l’outil Pin Planner pour effectuer l’attribution des broches conformément aux définitions fournies par la DE10-Lite. Ensuite, nous procédons à une compilation complète du design et, en l’absence d’erreurs, nous pouvons programmer l’architecture sur la carte de développement.

## Nios-II
À l’aide du terminal Nios II, nous commençons par exécuter la commande suivante pour générer le fichier BSP (Board Support Package) :  
***nios2-bsp hal software/led_bsp unsaved.sopcinfo*** 
Ensuite, nous utilisons la commande suivante pour créer le fichier Makefile :
***nios2-app-generate-makefile -app-dir ./ --bsp-dir D:\\esn11\\software\\led_bsp --src-files main.c***
***make download-elf*** 
Une fois ces étapes terminées, nous pouvons écrire un script en langage C, le compiler, puis le téléverser sur la carte de développement pour l’exécuter.

## Résultats

[click here to access the video](./lab1.mp4)

## Conclusion
