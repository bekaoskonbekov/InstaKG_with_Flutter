import 'lottie_animation_view.dart';
import 'models/lottie_animations_model.dart';

class ErrorAnimationView extends LottieAnimationView {
  ErrorAnimationView({super.key})
      : super(
          animation: LottieAnimation.error,
        );
}
