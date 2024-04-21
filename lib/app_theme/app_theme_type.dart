enum AppThemeType {
  defaultTheme,
  light,
  dark;

  int get key {
    switch (this) {
      case AppThemeType.dark:
        return 2;
      case AppThemeType.light:
        return 1;
      default:
        return 0;
    }
  }
}
