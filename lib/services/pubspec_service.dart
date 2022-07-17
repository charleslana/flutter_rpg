import 'dart:io';

import 'package:path/path.dart';
import 'package:yaml/yaml.dart';

class PubspecService {
  String pathToYaml =
      join(dirname(Platform.script.toFilePath()), 'pubspec.yaml');
  Future<YamlMap> loadPubspec() async =>
      loadYaml(await File(pathToYaml).readAsString());

  Future<String> getVersion() async {
    final YamlMap pubspec = await loadPubspec();
    return pubspec['version'].toString().split('+')[0];
  }
}
