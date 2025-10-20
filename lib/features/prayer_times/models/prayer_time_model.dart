class PrayerTimeModel {
  final String fajr;
  final String dhuhr;
  final String asr;
  final String maghrib;
  final String isha;

  PrayerTimeModel({
    required this.fajr,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
  });

  factory PrayerTimeModel.fromMap(Map<String, dynamic> data) {
    return PrayerTimeModel(
      fajr: data['Fajr'],
      dhuhr: data['Dhuhr'],
      asr: data['Asr'],
      maghrib: data['Maghrib'],
      isha: data['Isha'],
    );
  }
}
