import 'package:macquire_app/app_theme/app_theme_type.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeManager {
  factory AppThemeManager() {
    _instance ??= AppThemeManager._internal();
    return _instance!;
  }

  AppThemeManager._internal();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Function()? themeChanged;

  static AppThemeManager? _instance;
  AppThemeType currentAppTheme = AppThemeType.defaultTheme;

  Future<void> setInitialTheme() async {
    final SharedPreferences prefs = await _prefs;
    final int savedThemeInt = prefs.getInt('theme') ?? 0;
    if (savedThemeInt == 0) {
      changeTheme(AppThemeType.defaultTheme);
    } else if (savedThemeInt == 1) {
      changeTheme(AppThemeType.light);
    } else {
      changeTheme(AppThemeType.dark);
    }
  }

  Future<void> changeTheme(AppThemeType theme) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setInt('theme', theme.key);
    currentAppTheme = theme;
    themeChanged?.call();
  }
}
