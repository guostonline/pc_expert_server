import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pc_expert_server/MyWidgets/MyList.dart';
import 'package:pc_expert_server/Pages/InformationPage.dart';
import 'package:pc_expert_server/model/Constante.dart';
import 'package:pc_expert_server/model/DemandeModel.dart';
import 'package:pc_expert_server/model/FireStoreServices.dart';
import 'package:pc_expert_server/model/MesFunction.dart';
import 'package:pc_expert_server/model/MyProvider.dart';
import 'package:provider/provider.dart';

int myStatic = 0;

class FirstPage extends StatefulWidget {
  FirstPage({Key key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

TextEditingController textEditingController = TextEditingController();

class _FirstPageState extends State<FirstPage> {
  List<DemandeModel> items;
  List<DemandeModel> items2;
  FirestoreService firestoreService = FirestoreService();
  StreamSubscription<QuerySnapshot> demandesList;
  @override
  void initState() {
    super.initState();
    items = List();
    items2 = List();
    demandesList?.cancel();
    demandesList =
        firestoreService.getDemandeList().listen((QuerySnapshot snapshot) {
      final List<DemandeModel> demande = snapshot.docs
          .map((documentSnapshot) =>
              DemandeModel.fromMap(documentSnapshot.data()))
          .toList();
      setState(() {
        this.items = items2 = demande;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<MyProvider>();
    return Scaffold(
      appBar: AppBar(
        title: provider.isVisibleSearch
            ? Visibility(
                visible: provider.isVisibleSearch,
                child: Container(
                  child: Row(
                    children: [
                      Flexible(
                          child: TextField(
                              autofocus: true,
                              controller: textEditingController,
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  hintText: "Search...",
                                  hintStyle: TextStyle(
                                      color: Colors.white.withOpacity(0.5))),
                              onChanged: (value) {
                                setState(() {
                                  items2 = items
                                      .where((element) => (element.marqueDePc
                                              .toLowerCase()
                                              .trim()
                                              .contains(
                                                  value.toLowerCase()) || //or
                                          element.userName
                                              .toLowerCase()
                                              .trim()
                                              .contains(
                                                  value.toLowerCase()) || //or
                                          element.composantDePc
                                              .toLowerCase()
                                              .trim()
                                              .contains(
                                                  value.toLowerCase()))) //or
                                      .toList();
                                });
                              })),
                      IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              items2 = items;
                            });
                            textEditingController.clear();

                            //provider.funIsVisibleSearch(false);
                          })
                    ],
                  ),
                ),
              )
            : Text("${myStatic.toString()} demandes"),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                provider.isVisibleSearch
                    ? provider.funIsVisibleSearch(false)
                    : provider.funIsVisibleSearch(true);
              }),
          PopupMenuButton<String>(
              onSelected: funMenu,
              itemBuilder: (context) {
                return choices.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              }),
        ],
      ),
      body: Container(
        child: ListView.builder(
            itemCount: items2.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          InformationPage(demandeModel: items2[index]),
                    ),
                  );
                },
                child: myList(
                  selectColor(items2[index].statut),
                  items2[index].userName,
                  items2[index].statut,
                  items2[index].numberPhone,
                  items2[index].marqueDePc,
                  items2[index].referanceDePc,
                  items2[index].serieDePc,
                  ' ${items2[index].composantDePc} (${items2[index].descriptionDeComposant})',
                  AssetImage(selectImageToAvatar(items2[index].marqueDePc)),
                  items2[index].dateRequette,
                ),
              );
            }),
      ),
    );
  }

  void funMenu(String menuName) {
    //var provider = context.watch<MyProvider>();
    switch (menuName) {
      case "Tout les demandes":
        funToutLesDemandes();
        break;
      case "Demandes validés":
        funFilterByDemandeValide();
        break;
      case "En cours":
        funFilterByCourent();
        break;
      case "Demandes rajoutés":
        funFilterByRejouter();
        break;
      case "Nouveau demandes":
        funFilterByNouveau();
        break;
      case "Trier par date":
        funFilterByDate();
        break;
      default:
    }
  }

  funToutLesDemandes() {
    setState(() {
      items2 = items.toList();
    });
    myStatic = items2.length;
  }

  funFilterByDemandeValide() {
    setState(() {
      items2 = items
          .where((element) => (element.statut
              .toLowerCase()
              .trim()
              .contains("Demande validé".toLowerCase()))) //or
          .toList();
    });
    myStatic = items2.length;
  }

  funFilterByCourent() {
    setState(() {
      items2 = items
          .where((element) =>
              (element.statut.contains("En cours")) || //or
              (element.statut.contains("Disponible")) ||
              (element.statut.contains("Disponible dans 1 jours")) ||
              (element.statut.contains("Disponible dans 3 jours")) ||
              (element.statut.contains("Disponible dans 7 jours")))
          .toList();
    });
    myStatic = items2.length;
  }

  funFilterByRejouter() {
    setState(() {
      items2 = items
          .where((element) => (element.statut.contains("Non disponible"))) //or
          .toList();
    });
    myStatic = items2.length;
  }

  funFilterByNouveau() {
    setState(() {
      items2 = items
          .where((element) => (element.statut.contains("nouveau"))) //or
          .toList();
    });
    myStatic = items2.length;
  }

  funFilterByDate() {
    setState(() {
      items2 = items;
      items2.sort((a, b) {
        return b.dateRequette.compareTo(a.dateRequette);
      });
    });
    myStatic = items2.length;
  }
}
