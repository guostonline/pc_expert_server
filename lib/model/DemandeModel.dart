class DemandeModel {
  String _id;
  String _userName;
  String _numberPhone;
  String _marqueDePc;
  String _referanceDePc;
  String _serieDePc;
  String _composantDePc;
  String _descriptionDeComposant;
  String _dateRequette;
  String _dateLivraison;
  String _prix;
  String _statut;
  String _photoDePc;
  String _autre1;
  String _autre2;
  String _autre3;

  DemandeModel(
    this._id,
    this._userName,
    this._numberPhone,
    this._marqueDePc,
    this._referanceDePc,
    this._serieDePc,
    this._composantDePc,
    this._descriptionDeComposant,
    this._dateRequette,
    this._dateLivraison,
    this._prix,
    this._statut,
    this._photoDePc,
    this._autre1,
    this._autre2,
    this._autre3,
    //14
  );
  DemandeModel.map(dynamic obj) {
    this._id = obj['id'];
    this._userName = obj['userName'];
    this._numberPhone = obj['numberPhone'];
    this._marqueDePc = obj['marqueDePc'];
    this._referanceDePc = obj['referanceDePc'];
    this._serieDePc = obj['serieDePc'];
    this._composantDePc = obj['composantDePc'];
    this._descriptionDeComposant = obj['descriptionDeComposant'];
    this._dateRequette = obj['dateRequette'];
    this._dateLivraison = obj['dateLivraison'];
    this._prix = obj['prix'];
    this._statut = obj['statut'];
    this._photoDePc = obj['photoDePc'];
    this._autre1 = obj['autre1'];
    this._autre1 = obj['autre2'];
    this._autre1 = obj['autre3'];
  }

  String get id => _id;
  String get userName => _userName;
  String get numberPhone => _numberPhone;
  String get marqueDePc => _marqueDePc;
  String get referanceDePc => _referanceDePc;
  String get serieDePc => _serieDePc;
  String get composantDePc => _composantDePc;
  String get descriptionDeComposant => _descriptionDeComposant;
  String get dateRequette => _dateRequette;
  String get dateLivraison => _dateLivraison;
  String get prix => _prix;
  String get statut => _statut;
  String get photoDePc => _photoDePc;
  String get autre1 => _autre1;
  String get autre2 => _autre2;
  String get autre3 => _autre3;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['id'] = _id;
    map['userName'] = _userName;
    map['numberPhone'] = _numberPhone;
    map['marqueDePc'] = _marqueDePc;
    map['referanceDePc'] = _referanceDePc;
    map['serieDePc'] = _serieDePc;
    map['composantDePc'] = _composantDePc;
    map['descriptionDeComposant'] = _descriptionDeComposant;
    map['dateRequette'] = _dateRequette;
    map['dateLivraison'] = _dateLivraison;
    map['prix'] = _prix;
    map['statut'] = _statut;
    map['photoDePc'] = _photoDePc;
    map['autre1'] = _autre1;
    map['autre2'] = _autre2;
    map['autre3'] = _autre3;

    return map;
  }

  DemandeModel.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._userName = map['userName'];
    this._numberPhone = map['numberPhone'];
    this._marqueDePc = map['marqueDePc'];
    this._referanceDePc = map['referanceDePc'];
    this._serieDePc = map['serieDePc'];
    this._composantDePc = map['composantDePc'];
    this._descriptionDeComposant = map['descriptionDeComposant'];
    this._dateRequette = map['dateRequette'];
    this._dateLivraison = map['dateLivraison'];
    this._prix = map['prix'];
    this._statut = map['statut'];
    this._photoDePc = map['photoDePc'];
    this._autre1 = map['autre1'];
    this._autre2 = map['autre2'];
    this._autre3 = map['autre3'];
  }
}
