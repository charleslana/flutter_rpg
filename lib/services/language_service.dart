import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageService {
  final GetStorage _box = GetStorage();
  final String _key = 'languageCode';

  Locale? get locale => _loadFromBox() != null ? Locale(_loadFromBox()!) : null;

  String? _loadFromBox() => _box.read(_key);

  void _saveToBox(String languageCode) => _box.write(_key, languageCode);

  void change(Locale locale) {
    Get.updateLocale(locale);
    _saveToBox(locale.languageCode);
  }
}
