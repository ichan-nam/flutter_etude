class FlagUtil {
  static const _nationalityToFlag = <String, String>{
    'AU': '🇦🇺',
    'BR': '🇧🇷',
    'CA': '🇨🇦',
    'CH': '🇨🇭',
    'DE': '🇩🇪',
    'DK': '🇩🇰',
    'ES': '🇪🇸',
    'FI': '🇫🇮',
    'FR': '🇫🇷',
    'GB': '🇬🇧',
    'IE': '🇮🇪',
    'IN': '🇮🇳',
    'IR': '🇮🇷',
    'MX': '🇲🇽',
    'NL': '🇳🇱',
    'NO': '🇳🇴',
    'NZ': '🇳🇿',
    'RS': '🇷🇸',
    'TR': '🇹🇷',
    'UA': '🇺🇦',
    'US': '🇺🇸',
  };

  static String getFlagByNationality(String nationality) =>
      _nationalityToFlag[nationality]!;
}
