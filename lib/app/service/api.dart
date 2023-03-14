import '../config/config.dart';

class ApiService {
  // auth
  static const login = AppConfig.baseUrl;
  static const register = "${AppConfig.baseUrl}action=register";

  //profile
  static const getProfile = "${AppConfig.baseUrl}?getprofile=";
  static const updateProfile = "${AppConfig.baseUrl}action=updateprofile";

  //forgot password
  static const validateEmail = "${AppConfig.baseUrl}action=validateEmail";

  //update password
  static const updatePassword = "${AppConfig.baseUrl}action=updatePassword";

  //doctor
  static const getDoctors = "${AppConfig.baseUrl}getdoctors=";

  // appointment
  static const getAppointments = "${AppConfig.baseUrl}getappointment=";

  //report
  static const getVitalSigns = "${AppConfig.baseUrl}getvital=";

  //ledger
  static const getLedger = "${AppConfig.baseUrl}?getLedger=";

  //withdraw
  static const withdrawRequest = AppConfig.baseUrl;
}
