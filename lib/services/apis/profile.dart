import 'package:flutter_templete/services/http.api.dart';

class UsersAPIService {
  final BackendAPIService backend;

  UsersAPIService({required this.backend});

  // Future<UserProfile> getUserProfile() async {
  //   return backend.authenticatedRequest("api/v1/auth/info",
  //       method: RequestMethod.get,
  //       isDataResponse: false,
  //       fromJson: (json) => {} //UserProfile.fromJson,
  //       );
  // }
}
