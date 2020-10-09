import 'package:flutter/cupertino.dart';

final TextStyle myStyleGrandTitle =
    TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
final TextStyle myStyleSubTitle = TextStyle(fontSize: 16);
final TextStyle myStyleSmalTitle = TextStyle(fontSize: 14);
final TextStyle myStyleComposantTitle =
    TextStyle(fontSize: 14, fontWeight: FontWeight.bold);

const List<String> traitement = [
  'Disponible',
  "En cours de rechercher",
  "Disponible dans 1 jours",
  "Disponible dans 3 jours",
  "Disponible dans 7 jours",
  "Non disponible",
  "Demande validé",
];

const List<String> firstPageMenu = [
  "Tout les demandes",
  "Trier par date",
  "En cours",
  "Demandes validés",
  "Demandes rejoutés",
  "Statique",
];
const String toutLesDemandes = "Tout les demandes";
const String lesNouveau = "Nouveau demandes";
const String tryByDate = "Trier par date";
const String enCours = "En cours";
const String valid = "Demandes validés";
const String rajouter = "Demandes rajoutés";
const String statique = "Statique";

const List<String> choices = <String>[
  toutLesDemandes,
  lesNouveau,
  tryByDate,
  enCours,
  valid,
  rajouter,
  statique
];
