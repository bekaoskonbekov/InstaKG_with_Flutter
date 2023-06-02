import 'package:flutter_riverpod_practice1/views/components/dialog/dialog_model.dart';

import '../../constants/string.dart';

class DeleteDialog extends AlertDialogModel<bool> {
  DeleteDialog({
    required String titleOfObjectDelete,
  }) : super(
            title: '${Strings.delete} $titleOfObjectDelete?',
            message:
                '${Strings.areYouSureYouWantToDeleteThis} $titleOfObjectDelete?',
            buttons: {Strings.cancel: false, Strings.delete: true});
}
