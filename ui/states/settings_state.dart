import 'package:flutter/widgets.dart';
import 'package:test/W6/data/app_settings_repo.dart';

import '../../model/settings/app_settings.dart';

class AppSettingsState extends ChangeNotifier {
  final AppSettingsRepository repository;

  AppSettings? _appSettings;

  AppSettingsState({required this.repository});

  Future<void> init() async {
    // Might be used to load data from repository
    _appSettings = await repository.load();
    notifyListeners();
  }

  ThemeColor get theme => _appSettings?.themeColor ?? ThemeColor.blue;

  Future<void> changeTheme(ThemeColor themeColor) async {
    if (_appSettings == null) return;
    _appSettings = _appSettings!.copyWith(themeColor: themeColor);

    notifyListeners();
    await repository.save(_appSettings!);
  }
}
