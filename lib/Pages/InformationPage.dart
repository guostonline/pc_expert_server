import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:pc_expert_server/model/Constante.dart';
import 'package:pc_expert_server/model/DemandeModel.dart';
import 'package:pc_expert_server/model/FireStoreServices.dart';
import 'package:pc_expert_server/model/MesFunction.dart';
import 'package:pc_expert_server/model/MyProvider.dart';
import 'package:provider/provider.dart';

String disponibiliter;
String formattedDate = DateFormat('d/MM/yy').format(DateTime.now());

class InformationPage extends StatelessWidget {
  final DemandeModel demandeModel;

  InformationPage({Key key, @required this.demandeModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var provider = context.watch<MyProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(demandeModel.userName),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                elevation: 10,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      myText(demandeModel.marqueDePc,
                          " ${demandeModel.referanceDePc} ${demandeModel.serieDePc}"),
                      Container(
                        height: 60,
                        width: 60,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                              selectImageToAvatar(demandeModel.marqueDePc)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              myStack(
                  demandeModel.photoDePc != null
                      ? demandeModel.photoDePc
                      : Image.asset("pc_expert.jpg"),
                  selectComposantDemander(demandeModel.composantDePc)),
              SizedBox(height: 20),
              Card(
                  elevation: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        myText("Composant demandé", demandeModel.composantDePc),
                        myText("Détail", demandeModel.descriptionDeComposant),
                      ],
                    ),
                  )),
              SizedBox(height: 20),
              Card(
                elevation: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      myText("Nom du client", demandeModel.userName),
                      myText("Téléphone", demandeModel.numberPhone),
                      myText("Date de demande", demandeModel.dateRequette),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Card(
                elevation: 10,
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: demandeModel.prix != null
                              ? demandeModel.prix
                              : "Prix",
                          helperText: demandeModel.prix != null
                              ? "Prix initial : " + demandeModel.prix
                              : "",
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) => provider.prix = value,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Stock"),
                          DropdownButton<String>(
                            items: traitement.map((String value) {
                              return new DropdownMenuItem<String>(
                                child: Text(value),
                                value: value,
                              );
                            }).toList(),
                            hint: Text(provider.stock),
                            onChanged: (value) {
                              provider.selectStock(value);
                            },
                          ),
                        ],
                      ),
                      TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: demandeModel.autre1 != null
                                ? "Note"
                                : demandeModel.autre1),
                        onChanged: (value) => provider.note = value,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Card(
                elevation: 15,
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: provider.stock != "Non disponible"
                        ? AutoSizeText(
                            "salut vous demandez un(e) ${demandeModel.composantDePc}(${demandeModel.descriptionDeComposant}) de la marque ${demandeModel.marqueDePc} ${demandeModel.referanceDePc} ${demandeModel.serieDePc}. Est ${provider.stock}. le prix : ${provider.prix} DH",
                            maxLines: 2,
                          )
                        : AutoSizeText(
                            "salut vous demandez un(e) ${demandeModel.composantDePc}(${demandeModel.descriptionDeComposant}) de la marque ${demandeModel.marqueDePc} ${demandeModel.referanceDePc} ${demandeModel.serieDePc}. Est ${provider.stock}. désolé",
                            maxLines: 2,
                          )),
              ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    setdataOnFireStore(
                        demandeModel.userName,
                        demandeModel.numberPhone,
                        demandeModel.marqueDePc,
                        demandeModel.referanceDePc,
                        demandeModel.serieDePc,
                        demandeModel.composantDePc,
                        demandeModel.descriptionDeComposant,
                        demandeModel.dateRequette,
                        formattedDate,
                        provider.prix,
                        provider.stock,
                        demandeModel.photoDePc,
                        provider.note,
                        "",
                        "");
                    funSend(
                        demandeModel.numberPhone,
                        demandeModel.composantDePc,
                        demandeModel.marqueDePc,
                        demandeModel.referanceDePc,
                        demandeModel.serieDePc,
                        provider.stock,
                        provider.prix);
                    Fluttertoast.showToast(
                      msg: "Votre reponce est bien envoyer",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIos: 1,
                    );
                    Navigator.pop(context);
                  },
                  elevation: 15,
                  child: Text(
                    "Validé",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget myText(String titre, String description) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(titre,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text(description,
            style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic)),
      ],
    ),
  );
}

Widget myStack(String photoDePc, String composant) {
  return Stack(
    children: [
      Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 15),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            border: Border.all(color: Colors.black)),
        //width: 120,
        child: photoDePc == null
            ? ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: Image.asset("images/pc_expert.jpg"))
            : ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: Image.network(photoDePc)),
      ),
      Positioned(
          bottom: 20,
          right: 10,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 5)),
            height: 80,
            width: 80,
            child: Image.asset('images/$composant'),
          ))
    ],
  );
}
