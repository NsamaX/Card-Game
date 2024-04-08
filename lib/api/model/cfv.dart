import 'saveCard.dart';

class CardData extends SaveCard {
  final int id;
  final String cardType;
  final String clan;
  final int critical;
  final String designIllus;
  final String effect;
  final String flavor;
  final String format;
  final String grade;
  final String illust;
  final String illustColor;
  final String illust2;
  final String illust3;
  final String illust4;
  final String illust5;
  final String imageUrlEn;
  final String imageUrlJp;
  final String imaginaryGift;
  final String italian;
  final String kana;
  final String kanji;
  final String korean;
  final String limitationText;
  final String mangaIllus;
  final String name;
  final String nation;
  final String note;
  final String otherNames;
  final String phonetic;
  final int power;
  final String race;
  final String rideSkill;
  final List<String> sets;
  final Map<String, String> tournamentStatuses;
  final int shield;
  final String skill;
  final String thai;
  final String translation;
  final String triggerEffect;

  CardData({
    required this.id,
    required this.cardType,
    required this.clan,
    required this.critical,
    required this.designIllus,
    required this.effect,
    required this.flavor,
    required this.format,
    required this.grade,
    required this.illust,
    required this.illustColor,
    required this.illust2,
    required this.illust3,
    required this.illust4,
    required this.illust5,
    required this.imageUrlEn,
    required this.imageUrlJp,
    required this.imaginaryGift,
    required this.italian,
    required this.kana,
    required this.kanji,
    required this.korean,
    required this.limitationText,
    required this.mangaIllus,
    required this.name,
    required this.nation,
    required this.note,
    required this.otherNames,
    required this.phonetic,
    required this.power,
    required this.race,
    required this.rideSkill,
    required this.sets,
    required this.tournamentStatuses,
    required this.shield,
    required this.skill,
    required this.thai,
    required this.translation,
    required this.triggerEffect,
  });

  factory CardData.fromJson(Map<String, dynamic> json) {
    return CardData(
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
      'id': id,
      'cardtype': cardType,
      'clan': clan,
      'critical': critical,
      'designillus': designIllus,
      'effect': effect,
      'flavor': flavor,
      'format': format,
      'grade': grade,
      'illust': illust,
      'illustcolor': illustColor,
      'illust2': illust2,
      'illust3': illust3,
      'illust4': illust4,
      'illust5': illust5,
      'imageurlen': imageUrlEn,
      'imageurljp': imageUrlJp,
      'imaginarygift': imaginaryGift,
      'italian': italian,
      'kana': kana,
      'kanji': kanji,
      'korean': korean,
      'limitationtext': limitationText,
      'mangaillust': mangaIllus,
      'name': name,
      'nation': nation,
      'note': note,
      'othernames': otherNames,
      'phonetic': phonetic,
      'power': power,
      'race': race,
      'rideskill': rideSkill,
      'sets': sets,
      'tournamentstatuses': tournamentStatuses,
      'shield': shield,
      'skill': skill,
      'thai': thai,
      'translation': translation,
      'triggereffect': triggerEffect,
    };
  }

  Map<String, dynamic> getCardDataMap(CardData model) {
    Map<String, dynamic> dataMap = {};

    if (model.name != '') dataMap['Name'] = model.name;
    if (model.flavor != '') dataMap['Flavor'] = '" ' + model.flavor + ' "';
    if (model.skill != '') dataMap['Skill'] = model.skill;
    if (model.effect != '') dataMap['Effect'] = model.effect;
    if (model.rideSkill != '') dataMap['Ride Skill'] = model.rideSkill;
    if (model.triggerEffect != '')
      dataMap['Trigger Effect'] = model.triggerEffect;
    if (model.power != '' && model.shield != '') {
      dataMap['Power & Shield'] = '${model.power} / ${model.shield}';
    } else if (model.power != '') {
      dataMap['Power'] = model.power;
    } else if (model.shield != '') {
      dataMap['Shield'] = model.shield;
    }
    if (model.clan != '' && model.shield != '') {
      dataMap['Clan & Nation'] = '${model.clan} / ${model.nation}';
    } else if (model.clan != '') {
      dataMap['Clan'] = model.clan;
    } else if (model.nation != '') {
      dataMap['Nation'] = model.nation;
    }
    if (model.limitationText != '')
      dataMap['Limitation Text'] = model.limitationText;
    if (model.format != '') dataMap['Format'] = model.format;
    if (model.sets.isNotEmpty) dataMap['Sets'] = model.sets;

    return dataMap;
  }

  String getImage() {
    return imageUrlJp;
  }
}
