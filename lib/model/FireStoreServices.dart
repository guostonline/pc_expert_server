import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

final CollectionReference myCollection =
    FirebaseFirestore.instance.collection('demandes');

class FirestoreService {
  Stream<QuerySnapshot> getDemandeList({int offset, int limit}) {
    Stream<QuerySnapshot> snapshots = myCollection.snapshots();

    if (offset != null) {
      snapshots = snapshots.skip(offset);
    }
    if (limit != null) {
      snapshots = snapshots.take(limit);
    }
    return snapshots;
  }
}

setdataOnFireStore(
  String userName,
  String numberPhone,
  String marqueDePc,
  String referanceDePc,
  String serieDePc,
  String composantDePc,
  String descriptionDeComposant,
  String dateRequette,
  String dateLivraison,
  String prix,
  String statut,
  String photoDePc,
  String autre1,
  String autre2,
  String autre3,

  //12
) {
  DocumentReference ds = FirebaseFirestore.instance
      .collection("demandes")
      .doc(userName + marqueDePc + serieDePc);

  Map<String, dynamic> task = {
    "userName": userName,
    "numberPhone": numberPhone,
    "marqueDePc": marqueDePc,
    "referanceDePc": referanceDePc,
    "serieDePc": serieDePc,
    "composantDePc": composantDePc,
    "descriptionDeComposant": descriptionDeComposant,
    "dateRequette": dateRequette,
    "dateLivraison": dateLivraison,
    "prix": prix,
    "statut": statut,
    "photoDePc": photoDePc,
    "autre1": autre1,
    "autre2": autre2,
    "autre3": autre3,
  };

  ds.set(task).whenComplete(() {
    print("all inforamtion send to firebase");
  });
}
