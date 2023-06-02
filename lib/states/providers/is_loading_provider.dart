import 'package:flutter_riverpod_practice1/states/image_uploads/providers/image_upload_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../auth/providers/auth_state_providers.dart';

final isLoadingProvider = Provider<bool>((ref) {
  final authState = ref.watch(authStateProvider);
  final isUploadImage = ref.watch(imageUploadProvider);

  return authState.isLoading || isUploadImage;
});
