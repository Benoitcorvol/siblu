class DistributionService {
  static const String WEB_DISTRIBUTION_URL = 'https://install.campinggameshow.com';
  
  Future<String> generateUniversalQRCode() async {
    final installData = {
      'android': {
        'url': '$WEB_DISTRIBUTION_URL/android',
        'version': '1.0.0',
        'minSdk': 23,
      },
      'ios': {
        'url': '$WEB_DISTRIBUTION_URL/ios',
        'version': '1.0.0',
        'minVersion': '12.0',
      },
      'desktop': {
        'windows': '$WEB_DISTRIBUTION_URL/windows',
        'mac': '$WEB_DISTRIBUTION_URL/mac',
        'linux': '$WEB_DISTRIBUTION_URL/linux',
      },
      'web': '$WEB_DISTRIBUTION_URL/web',
    };
    
    return jsonEncode(installData);
  }
}