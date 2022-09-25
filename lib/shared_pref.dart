import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
      static late SharedPreferences _sp;
      Future init() async{
     _sp=await SharedPreferences.getInstance();
      }
  Future setName(String name) async {
    await _sp.setString("name", name);
  }
  Future setLogginStatus(String status) async {
    await _sp.setString("status", status);
  }

  Future setPassword(String password) async {
    await _sp.setString("password", password);
  }

  Future setEmail(String email) async {
    await _sp.setString("email", email);
  }

  Future setPhoneNo(String phoneNo) async {
    await _sp.setString("phoneNo", phoneNo);
  }

  Future setProffession(String proffession) async {
    await _sp.setString("proffession", proffession);
  }

  String? getName() {
    return _sp.getString("name");
  }
  String? getLogginStatus() {
    return _sp.getString("status");
  }

  String? getPassword() {
    return _sp.getString("password");
  }

  String? getEmail() {
    return _sp.getString("email");
  }

  String? getPhoneNo() {
    return _sp.getString("phoneNo");
  }

  String? getProffession() {
    return _sp.getString("proffession");
  }
}
