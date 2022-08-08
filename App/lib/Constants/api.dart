const String baseAPI = "http://10.0.2.2:3000";

class UsersEndpoints {
  static const String signUp = "/users/signup";
  static const String signIn = "/users/signin";
}

class RecordsEndpoints {
  static const String createRecord = "/records/create-record";
  static const String getRecords = "/records/get-all-records";
  static const String getRecord = "/records/get-record";
  static const String deleteRecord = "/records/delete-record";
}
