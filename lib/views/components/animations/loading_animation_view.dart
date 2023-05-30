import 'lottie_animation_view.dart';
import 'models/lottie_animations_model.dart';

class LoadingAnimationView extends LottieAnimationView {
  LoadingAnimationView({super.key})
      : super(
          animation: LottieAnimation.loading,
        );
}
