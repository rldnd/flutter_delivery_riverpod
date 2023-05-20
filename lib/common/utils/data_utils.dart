import 'dart:convert';

import 'package:flutter_delivery/common/constant/data.dart';

class DataUtils {
  static String pathToUrl(String path) {
    return 'http://$ip$path';
  }

  static List<String> listPathsToUrls(List paths) {
    return paths.map((path) => pathToUrl(path)).toList();
  }

  static String plainToBase64(String plain) {
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    return stringToBase64.encode(plain);
  }
}
