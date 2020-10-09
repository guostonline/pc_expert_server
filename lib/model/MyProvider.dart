import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pc_expert_server/model/FireStoreServices.dart';

import 'DemandeModel.dart';

class MyProvider extends ChangeNotifier {
  List<DemandeModel> items2;
  List<DemandeModel> items;
  FirestoreService firestoreService = FirestoreService();
  StreamSubscription<QuerySnapshot> demandesList;

  String stock = "Disponible";
  String prix = "0";
  String note = "";
  String imagePathComposant;
  bool isVisibleSearch = false;

  selectStock(String myStock) {
    stock = myStock;
    notifyListeners();
  }

  selectPrix(String myPrix) {
    stock = myPrix;
    notifyListeners();
  }

  selectNote(String myNote) {
    note = myNote;
    notifyListeners();
  }

  funIsVisibleSearch(bool isVisible) {
    isVisibleSearch = isVisible;
    notifyListeners();
  }

  choiceAction(String choise) {
    switch (choise) {
      case "Rechercher":
        isVisibleSearch = true;
        break;
      case "Rechercher":
        isVisibleSearch = true;
        break;
      default:
    }
    notifyListeners();
  }
}
