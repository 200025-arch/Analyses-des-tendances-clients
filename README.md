# Analyses-des-tendances-clients
L’objectif de ce projet est d’analyser le comportement des clients d’un site e‑commerce afin d’identifier les tendances d’achat, les facteurs influençant les commandes et les segments clients les plus rentables.

<img width="1201" height="791" alt="Image" src="https://github.com/user-attachments/assets/bbfbe18a-dcf2-40c0-ab8c-cc51b59920ca" />

----

## 🛠️ Pipeline et outils utilisés

**1. Exploration et préparation des données – Python (Pandas)**
- Nettoyage du dataset (valeurs manquantes, formats, doublons).
- Analyse statistique descriptive.
- Création de nouvelles variables (groupes d’âge, classification des catégories…).
- Export vers PostgreSQL pour exploitation avancée.

**2. Modélisation & requêtes avancées – PostgreSQL**
- Mise en place d’une base de données relationnelle.
- Requêtes SQL complexes pour :
  - analyser les revenus par catégorie,
  - segmenter les clients,
  - mesurer l’impact du type de livraison sur les ventes,
  - calculer le panier moyen et la fréquence d’achat.

**3. Visualisation & Storytelling – Power BI**

Création d’un dashboard interactif permettant une analyse dynamique selon :
- le statut d’abonnement,
- le genre,
- la catégorie de produits,
- le type de livraison,
- le groupe d’âge des clients.

----

## 📊 Principaux indicateurs du dashboard

**🔢 KPI**
- **3,9K** clients dans le dataset
- **59,76 €** de montant moyen par commande
- **3,75 / 5** de note moyenne donnée par les clients

**🧭 Segments & analyses**
- Statut d’abonnement
- Catégories de produits les plus génératrices de revenus
- Volumes de ventes par catégorie
- Analyse démographique

----
## 🔍 Ce que montre l’analyse

- Les catégories Clothing et Accessories concentrent la majorité des revenus et des ventes.
- Le segment Young Adult est le plus actif en termes d’achat.
- L’abonnement semble être encore peu adopté (27 %), révélant une opportunité pour des campagnes marketing ciblées.
- Certains types de livraison influencent légèrement les volumes de commande.
