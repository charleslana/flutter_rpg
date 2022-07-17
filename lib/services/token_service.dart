import 'package:get_storage/get_storage.dart';

class TokenService {
  final GetStorage _box = GetStorage();
  final String _key = 'token';

  String? get token => _loadFromBox() != null ? _loadFromBox()! : null;

  String? _loadFromBox() => _box.read(_key);

  void _saveToBox(String token) => _box.write(_key, token);

  void _removeToBox() => _box.remove(_key);

  void saveToken(String token) {
    _saveToBox(token);
  }

  void removeToken() {
    _removeToBox();
  }
}
