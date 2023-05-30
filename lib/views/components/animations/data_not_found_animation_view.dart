import 'package:flutter_riverpod_practice1/views/components/animations/lottie_animation_view.dart';

import 'models/lottie_animations_model.dart';

class DataNotFoudAnimationView extends LottieAnimationView {
  DataNotFoudAnimationView({super.key})
      : super(
          animation: LottieAnimation.dataNotFound,
        );
}
