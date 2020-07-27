import 'package:flutter/foundation.dart';

abstract class IAuthRepository {
  Future getUser();
  Future loginWithEmail({@required String email, @required String password});
}
