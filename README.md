# ACP
ACP : L’économie du secteur des technologies de l’information
Ce script réalise une Analyse en Composantes Principales (ACP)
à partir du fichier `techno_info.txt`.


Objectif
Ce projet applique une Analyse en Composantes Principales (ACP) aux données économiques du secteur des technologies de l’information (données INSEE).

L’objectif est de :
- réduire la dimension des données,
- identifier les facteurs structurants de l’activité économique,
- détecter d’éventuelles dépendances linéaires entre variables,
- analyser la structure sectorielle indépendamment de l’effet taille.

---
 Méthodologie
 
L’ACP est réalisée conformément aux notions vues en cours.
 1. Centrage et réduction
Les variables sont centrées puis réduites afin de travailler sur des données comparables.  
On utilise la matrice de variance-covariance des données standardisées (équivalente à la matrice des corrélations).

 2. Construction de la matrice de covariance
La matrice :
M = (XᵀX) / (n − 1)
est calculée à partir des données centrées-réduites.

 3. Diagonalisation
La décomposition de cette matrice fournit :
- les valeurs propres ,
- les vecteurs propres (axes principaux).
Les composantes sont triées par ordre décroissant d’inertie.

 4. Projection
Les secteurs sont projetés sur les deux premières composantes principales afin d’obtenir le plan factoriel.

 5. Analyses complémentaires
- identification des valeurs propres nulles (dépendances linéaires),
- étude de la matrice des corrélations (détection de redondances),
- suppression de variables fortement corrélées,
- normalisation par un indicateur de taille pour neutraliser l’effet dimension.
  
---
 Résultats
 
L’ACP met en évidence :
- une forte corrélation globale entre les variables économiques,
- l’existence d’un facteur dominant lié à la taille des secteurs,
- une structuration secondaire distinguant certains profils sectoriels.
Après réduction et normalisation, la structure devient plus lisible et permet une analyse relative des secteurs.
---
 Conclusion
 
L’ACP confirme que le secteur des technologies de l’information est principalement structuré par un facteur latent de taille économique.
La méthode permet de synthétiser l’information, d’identifier les redondances entre indicateurs et de visualiser la position relative des différents secteurs.
