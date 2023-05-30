import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/auth_result.dart';
import 'auth_state_providers.dart';

final isLoggedInProvider = Provider<bool>((ref) {
  final authState = ref.watch(authStateProvider);
  return authState.result == AuthResult.success;
});
