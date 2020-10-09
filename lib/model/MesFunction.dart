import 'package:flutter/material.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';

String selectImageToAvatar(String image) {
  switch (image) {
    case "Acer":
      return "images/acer.png";
      break;
    case "Apple":
      return "images/apple.jpg";
      break;
    case "Asus":
      return "images/asus.png";
      break;
    case "Dell":
      return "images/dell.png";
      break;
    case "Hp":
      return "images/hp.png";
      break;
    case "Lenovo":
      return "images/lenovo.png";
      break;
    case "Msi":
      return "images/msi.jpg";
      break;
    case "Samsung":
      return "images/samsung.png";
      break;
    case "Surface":
      return "images/surface.jpg";
      break;
    case "Toshiba":
      return "images/toshiba.png";
    case "Sony":
      return "images/sony.png";
      break;

    default:
  }
}

Color selectColor(String statut) {
  Color color = Colors.orange;
  if (statut == "Disponible") color = Colors.green;
  if (statut == "Disponible dans 1 jours") color = Colors.green;
  if (statut == "Disponible dans 3 jours") color = Colors.green;
  if (statut == "Disponible dans 7 jours") color = Colors.green;
  if (statut == "Demande validé") color = Colors.blue;
  if (statut == "Non disponible") color = Colors.red;
  if (statut == "nouveau") color = Colors.grey;
  return color;
}

funSend(
  String numberPhone,
  String composant,
  String marque,
  String referance,
  String serial,
  String stock,
  String prix,
) async {
  if (stock == "Non disponible") {
    await FlutterOpenWhatsapp.sendSingleMessage('$numberPhone',
        "salut vous demandez un(e) $composant de la marque $marque $referance $serial. Est $stock. désolé");
  }
  await FlutterOpenWhatsapp.sendSingleMessage('$numberPhone',
      "salut vous demandez un(e) $composant de la marque $marque $referance $serial. Est $stock. le prix : $prix DH");
}

String selectComposantDemander(String marque) {
  String imagePathComposant;
  switch (marque) {
    case "Back":
      {
        imagePathComposant = "back.jpg";
      }
      break;
    case "Circuit":
      {
        imagePathComposant = "circuit.jpg";
      }
      break;
    case "Autre":
      {}
      break;
    case "Clavier":
      {
        imagePathComposant = "clavier.jpg";
      }
      break;
    case "Ecran":
      {
        imagePathComposant = "display.jpg";
      }
      break;
    case "Matherboard":
      {
        imagePathComposant = "matherboard.jpg";
      }
      break;
    case "TrackPad":
      {
        imagePathComposant = "trackpad.jpg";
      }
      break;

    default:
  }
  return imagePathComposant;
}
