import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/post_settings.dart';
import '../notifiers/post_setiings_notifiers.dart';

final postSettingsProviders =
    StateNotifierProvider<PostSettingsNotifiers, Map<PostSetting, bool>>((ref) {
  return PostSettingsNotifiers();
});
