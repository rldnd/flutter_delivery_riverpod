import 'package:flutter_delivery/common/constant/data.dart';

class DataUtils {
  static String pathToUrl(String path) {
    return 'http://$ip$path';
  }

  static List<String> listPathsToUrls(List<String> paths) {
    return paths.map(pathToUrl).toList();
  }
}
