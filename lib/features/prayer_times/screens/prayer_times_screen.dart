import 'package:flutter/material.dart';
import 'package:chairman_para_app/features/prayer_times/models/prayer_time_model.dart';
import 'package:chairman_para_app/features/prayer_times/services/prayer_time_service.dart';

class PrayerTimesScreen extends StatefulWidget {
  const PrayerTimesScreen({super.key});

  @override
  State<PrayerTimesScreen> createState() => _PrayerTimesScreenState();
}

class _PrayerTimesScreenState extends State<PrayerTimesScreen> {
  final PrayerTimeService _prayerTimeService = PrayerTimeService();
  Future<PrayerTimeModel>? _prayerTimes;

  @override
  void initState() {
    super.initState();
    _prayerTimes = _prayerTimeService.getPrayerTimes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('নামাজ ও বিশেষ দিন'),
      ),
      body: FutureBuilder<PrayerTimeModel>(
        future: _prayerTimes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final prayerTimes = snapshot.data!;
            return ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                _buildPrayerTimeTile('ফজর', prayerTimes.fajr),
                _buildPrayerTimeTile('যোহর', prayerTimes.dhuhr),
                _buildPrayerTimeTile('আসর', prayerTimes.asr),
                _buildPrayerTimeTile('মাগরিব', prayerTimes.maghrib),
                _buildPrayerTimeTile('ইশা', prayerTimes.isha),
                const Divider(),
                const ListTile(
                  title: Text('বিশেষ নোটিশ'),
                  subtitle: Text('ঈদের জামাত সকাল ৮ টায় অনুষ্ঠিত হবে।'),
                ),
              ],
            );
          } else {
            return const Center(child: Text('No data found'));
          }
        },
      ),
    );
  }

  ListTile _buildPrayerTimeTile(String name, String time) {
    return ListTile(
      title: Text(name),
      trailing: Text(time),
    );
  }
}
