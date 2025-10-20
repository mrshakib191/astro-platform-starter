import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:chairman_para_app/features/prayer_times/models/prayer_time_model.dart';

class PrayerTimeService {
  Future<PrayerTimeModel> getPrayerTimes() async {
    final response = await http.get(Uri.parse(
        'http://api.aladhan.com/v1/timingsByCity?city=Dhaka&country=Bangladesh&method=8'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return PrayerTimeModel.fromMap(data['data']['timings']);
    } else {
      throw Exception('Failed to load prayer times');
    }
  }
}
