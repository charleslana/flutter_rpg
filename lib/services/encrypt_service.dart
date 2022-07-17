import 'dart:convert';

class EncryptService {
  Codec<String, String> stringToBase64 = utf8.fuse(base64);

  String encrypt(String credentials) {
    return stringToBase64.encode(credentials);
  }

  String decrypt(String encoded) {
    return stringToBase64.decode(encoded);
  }
}
