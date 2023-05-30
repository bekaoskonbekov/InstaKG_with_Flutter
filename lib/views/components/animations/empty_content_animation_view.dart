import 'lottie_animation_view.dart';
import 'models/lottie_animations_model.dart';

class EmptyContentAnimationView extends LottieAnimationView {
  EmptyContentAnimationView({super.key})
      : super(
          animation: LottieAnimation.dataNotFound,
        );
}
