import 'information.dart';
import 'save.dart';

class carDdatA extends savE implements informatioN {
  final int _id;
  final String _cardType;
  final String _clan;
  final int _critical;
  final String _designIllus;
  final String _effect;
  final String _flavor;
  final String _format;
  final String _grade;
  final String _illust;
  final String _illustColor;
  final String _illust2;
  final String _illust3;
  final String _illust4;
  final String _illust5;
  final String _imageUrlEn;
  final String _imageUrlJp;
  final String _imaginaryGift;
  final String _italian;
  final String _kana;
  final String _kanji;
  final String _korean;
  final String _limitationText;
  final String _mangaIllus;
  final String _name;
  final String _nation;
  final String _note;
  final String _otherNames;
  final String _phonetic;
  final int _power;
  final String _race;
  final String _rideSkill;
  final List<String> _sets;
  final Map<String, String> _tournamentStatuses;
  final int _shield;
  final String _skill;
  final String _thai;
  final String _translation;
  final String _triggerEffect;

  carDdatA({
    required int id,
    required String cardType,
    required String clan,
    required int critical,
    required String designIllus,
    required String effect,
    required String flavor,
    required String format,
    required String grade,
    required String illust,
    required String illustColor,
    required String illust2,
    required String illust3,
    required String illust4,
    required String illust5,
    required String imageUrlEn,
    required String imageUrlJp,
    required String imaginaryGift,
    required String italian,
    required String kana,
    required String kanji,
    required String korean,
    required String limitationText,
    required String mangaIllus,
    required String name,
    required String nation,
    required String note,
    required String otherNames,
    required String phonetic,
    required int power,
    required String race,
    required String rideSkill,
    required List<String> sets,
    required Map<String, String> tournamentStatuses,
    required int shield,
    required String skill,
    required String thai,
    required String translation,
    required String triggerEffect,
  })  : _id = id,
        _cardType = cardType,
        _clan = clan,
        _critical = critical,
        _designIllus = designIllus,
        _effect = effect,
        _flavor = flavor,
        _format = format,
        _grade = grade,
        _illust = illust,
        _illustColor = illustColor,
        _illust2 = illust2,
        _illust3 = illust3,
        _illust4 = illust4,
        _illust5 = illust5,
        _imageUrlEn = imageUrlEn,
        _imageUrlJp = imageUrlJp,
        _imaginaryGift = imaginaryGift,
        _italian = italian,
        _kana = kana,
        _kanji = kanji,
        _korean = korean,
        _limitationText = limitationText,
        _mangaIllus = mangaIllus,
        _name = name,
        _nation = nation,
        _note = note,
        _otherNames = otherNames,
        _phonetic = phonetic,
        _power = power,
        _race = race,
        _rideSkill = rideSkill,
        _sets = sets,
        _tournamentStatuses = tournamentStatuses,
        _shield = shield,
        _skill = skill,
        _thai = thai,
        _translation = translation,
        _triggerEffect = triggerEffect;

  factory carDdatA.fromJson(Map<String, dynamic> json) {
    return carDdatA(
      id: json['id'],
      cardType: json['cardtype'],
      clan: json['clan'],
      critical: json['critical'],
      designIllus: json['designillus'],
      effect: json['effect'],
      flavor: json['flavor'],
      format: json['format'],
      grade: json['grade'],
      illust: json['illust'],
      illustColor: json['illustcolor'],
      illust2: json['illust2'],
      illust3: json['illust3'],
      illust4: json['illust4'],
      illust5: json['illust5'],
      imageUrlEn: json['imageurlen'],
      imageUrlJp: json['imageurljp'],
      imaginaryGift: json['imaginarygift'],
      italian: json['italian'],
      kana: json['kana'],
      kanji: json['kanji'],
      korean: json['korean'],
      limitationText: json['limitationtext'],
      mangaIllus: json['mangaillust'],
      name: json['name'],
      nation: json['nation'],
      note: json['note'],
      otherNames: json['othernames'],
      phonetic: json['phonetic'],
      power: json['power'],
      race: json['race'],
      rideSkill: json['rideskill'],
      sets: List<String>.from(json['sets']),
      tournamentStatuses: Map<String, String>.from(json['tournamentstatuses']),
      shield: json['shield'],
      skill: json['skill'],
      thai: json['thai'],
      translation: json['translation'],
      triggerEffect: json['triggereffect'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': _id,
      'cardtype': _cardType,
      'clan': _clan,
      'critical': _critical,
      'designillus': _designIllus,
      'effect': _effect,
      'flavor': _flavor,
      'format': _format,
      'grade': _grade,
      'illust': _illust,
      'illustcolor': _illustColor,
      'illust2': _illust2,
      'illust3': _illust3,
      'illust4': _illust4,
      'illust5': _illust5,
      'imageurlen': _imageUrlEn,
      'imageurljp': _imageUrlJp,
      'imaginarygift': _imaginaryGift,
      'italian': _italian,
      'kana': _kana,
      'kanji': _kanji,
      'korean': _korean,
      'limitationtext': _limitationText,
      'mangaillust': _mangaIllus,
      'name': _name,
      'nation': _nation,
      'note': _note,
      'othernames': _otherNames,
      'phonetic': _phonetic,
      'power': _power,
      'race': _race,
      'rideskill': _rideSkill,
      'sets': _sets,
      'tournamentstatuses': _tournamentStatuses,
      'shield': _shield,
      'skill': _skill,
      'thai': _thai,
      'translation': _translation,
      'triggereffect': _triggerEffect,
    };
  }

  @override
  String getImage() {
    return _imageUrlJp;
  }

  @override
  String getName() => _name;

  @override
  Map<String, dynamic> getDataMap() {
    Map<String, dynamic> dataMap = {};

    if (_name != '') dataMap['Name'] = _name;
    if (_flavor != '') dataMap['Flavor'] = '" ' + _flavor + ' "';
    if (_skill != '') dataMap['Skill'] = _skill;
    if (_effect != '') dataMap['Effect'] = _effect;
    if (_rideSkill != '') dataMap['Ride Skill'] = _rideSkill;
    if (_triggerEffect != '') dataMap['Trigger Effect'] = _triggerEffect;
    if (_power != '' && _shield != '') {
      dataMap['Power & Shield'] = '$_power / $_shield';
    } else if (_power != '') {
      dataMap['Power'] = _power;
    } else if (_shield != '') {
      dataMap['Shield'] = _shield;
    }
    if (_clan != '' && _shield != '') {
      dataMap['Clan & Nation'] = '$_clan / $_nation';
    } else if (_clan != '') {
      dataMap['Clan'] = _clan;
    } else if (_nation != '') {
      dataMap['Nation'] = _nation;
    }
    if (_limitationText != '') dataMap['Limitation Text'] = _limitationText;
    if (_format != '') dataMap['Format'] = _format;
    if (_sets.isNotEmpty) dataMap['Sets'] = _sets;

    return dataMap;
  }

  // String getGrade() => _grade;

  List<String> getSets() => _sets;
}
