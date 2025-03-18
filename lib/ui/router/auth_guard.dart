//ignore_for_file: public_member_api_docs

// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';

// mock auth state
var isAuthenticated = false;

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (!isAuthenticated) {
      // ignore: unawaited_futures
      // router.push(
      // LoginRoute(onLoginResult: (_) {
      //   isAuthenticated = true;
      //   // we can't pop the bottom page in the navigator's stack
      //   // so we just remove it from our local stack
      //   router.markUrlStateForReplace();
      //   router.removeLast();
      //   resolver.next();
      // }),
      // );
    } else {
      resolver.next(true);
    }
  }
}

class AuthService extends ChangeNotifier {
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  set isAuthenticated(bool value) {
    _isAuthenticated = value;
    notifyListeners();
  }
}
