class AssetManifest {
  final List<AssetInfo> requiredAssets;
  final List<AssetInfo> optionalAssets;
  final String version;

  const AssetManifest({
    required this.requiredAssets,
    required this.optionalAssets,
    required this.version,
  });

  List<AssetInfo> get allAssets => [...requiredAssets, ...optionalAssets];
  
  bool containsAsset(String key) => 
    allAssets.any((asset) => asset.key == key);

  Map<String, dynamic> toJson() => {
    'version': version,
    'required': requiredAssets.map((a) => a.toJson()).toList(),
    'optional': optionalAssets.map((a) => a.toJson()).toList(),
  };

  factory AssetManifest.fromJson(Map<String, dynamic> json) => AssetManifest(
    version: json['version'] as String,
    requiredAssets: (json['required'] as List)
        .map((e) => AssetInfo.fromJson(e as Map<String, dynamic>))
        .toList(),
    optionalAssets: (json['optional'] as List)
        .map((e) => AssetInfo.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

class AssetInfo {
  final String key;
  final String url;
  final int size;
  final String hash;
  final String type;

  const AssetInfo({
    required this.key,
    required this.url,
    required this.size,
    required this.hash,
    required this.type,
  });

  Map<String, dynamic> toJson() => {
    'key': key,
    'url': url,
    'size': size,
    'hash': hash,
    'type': type,
  };

  factory AssetInfo.fromJson(Map<String, dynamic> json) => AssetInfo(
    key: json['key'] as String,
    url: json['url'] as String,
    size: json['size'] as int,
    hash: json['hash'] as String,
    type: json['type'] as String,
  );
}