library amap_base_core;

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

export 'model/lat_lng.dart';
export 'util/log.dart';
export 'util/misc.dart';
export 'util/permissions.dart';

class AMap {
  static final _channel = MethodChannel('me.yohom/amap_base');

  static Map<String, List<String>> assetManifest;

  static Future init(String key) async {
    _channel.invokeMethod('setKey', {'key': key});

    // 加载asset相关信息, 供区分图片分辨率用, 因为native端的加载asset方法无法区分分辨率, 这是一个变通方法
    assetManifest =
        await rootBundle.loadStructuredData<Map<String, List<String>>>(
      'AssetManifest.json',
      (String jsonData) {
        if (jsonData == null)
          return SynchronousFuture<Map<String, List<String>>>(null);

        final Map<String, dynamic> parsedJson = jsonDecode(jsonData);
        final Iterable<String> keys = parsedJson.keys;
        final Map parsedManifest = Map<String, List<String>>.fromIterables(
          keys,
          keys.map<List<String>>((key) => List<String>.from(parsedJson[key])),
        );
        return SynchronousFuture<Map<String, List<String>>>(parsedManifest);
      },
    );
  }
}
