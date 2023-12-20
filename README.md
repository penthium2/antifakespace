# antifakespace
outils supprimant les espaces insécables d'un script

Quel utilateur linux utilisant une VM dans workstation n'a jamais eu ce type de comportemant : 

```
var=0
if [[ "$var" = 0 ]] ; then
echo "$var"
fi
bash: [[ 0 : commande introuvable
```
ou derrière un "|", etc..

la cause le caractère insécable ou espace insécable.

il est possible de l'itendifier via la commande od : 

```
echo "if [[ "$var" = 0 ]] ; then
echo "$var"
fi
" | od -c
0000000   i   f       [   [ 302 240   0       =       0       ]   ]    
0000020   ;       t   h   e   n  \n   e   c   h   o       0  \n   f   i
0000040  \n  \n
0000042
```
Le fameux "302 240" !!

Comme il arrive ? via workstation (pas tester dans une console esxi) il est généré quand on tape trop vite l'espace après un caractère générer via ATL-GR ( ALT-GR+espace) ou avec ces carractères :
"[ | { ] } \"
 
ou sur linux bien plus rare avec la combinaisons : "shift+ALT-GR+espace"

De plus il y a le fameux caractère de fin de ligne windows "\r" (retour chariot) qui peut dans certain fichier de conf linux tout faire exploser.

Ce script va tout virer afin d'avoir un fichier propre.

pour le lancer : 

```
./antifakespace.sh fichier
```

comme toujour ma dévise : 
BASH4EVER
