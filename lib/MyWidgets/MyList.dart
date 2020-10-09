import 'package:flutter/material.dart';
import 'package:pc_expert_server/model/Constante.dart';

Widget myList(
    Color color,
    String nom,
    String statut,
    String numberPhone,
    String marque,
    String referance,
    String serial,
    String composant,
    AssetImage image,
    String date) {
  return Card(
    elevation: 15,
    margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
    child: Container(
        padding: EdgeInsets.only(right: 10),
        // margin: EdgeInsets.only(top: 15, bottom: 15, left: 5, right: 5),
        height: 100,
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          // borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.topLeft,
                //!! Container 1
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      width: 10,
                      decoration: BoxDecoration(
                          color: color, borderRadius: BorderRadius.circular(5)),
                    ),
                    SizedBox(width: 5),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(nom, style: myStyleGrandTitle),
                                  Text(numberPhone, style: myStyleSubTitle),
                                  Text(statut, style: TextStyle(fontSize: 12)),
                                ],
                              )),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Text(marque + " " + referance,
                                    style: myStyleSmalTitle),
                                VerticalDivider(
                                  color: Colors.black,
                                  thickness: 2,
                                ),
                                Text(serial, style: myStyleSmalTitle),
                                VerticalDivider(
                                  color: Colors.black,
                                  thickness: 2,
                                ),
                                Text(composant, style: myStyleComposantTitle),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              //!! Container 2
              // height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    child: CircleAvatar(
                      backgroundImage: image,
                    ),
                  ),
                  Text(
                    date,
                    style: myStyleSmalTitle,
                  ),
                ],
              ),
            ),
          ],
        )),
  );
}
