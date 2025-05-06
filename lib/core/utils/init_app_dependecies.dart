import 'package:mini_service_booking/core/services/prefs_service.dart';

Future<void> initAppDependencies() async {
  await PrefsService.init();
}
