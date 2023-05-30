import 'package:flutter_riverpod_practice1/views/components/dialog/dialog_model.dart';

import '../../constants/string.dart';

class LogOutDialog extends AlertDialogModel<bool> {
  LogOutDialog()
      : super(
            title: Strings.logOut,
            message: Strings.areYouSureThatYouWantToLogOutOfTheApp,
            buttons: {Strings.cancel: false, Strings.logOut: true});
}
