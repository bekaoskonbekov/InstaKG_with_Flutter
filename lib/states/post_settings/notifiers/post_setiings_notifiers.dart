import 'package:collection/collection.dart';
import 'package:flutter_riverpod_practice1/states/post_settings/models/post_settings.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PostSettingsNotifiers extends StateNotifier<Map<PostSetting, bool>> {
  PostSettingsNotifiers()
      : super(UnmodifiableMapView({
          for (final setting in PostSetting.values) setting: true,
        }));

  void setSetting(PostSetting setting, bool value) {
    final existingValue = state[setting];
    if (existingValue == null || existingValue == value) {
      return;
    }
    state = Map.unmodifiable(Map.from(state)..[setting] = value);
  }
}
