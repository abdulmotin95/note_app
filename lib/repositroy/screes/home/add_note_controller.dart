import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widget/ui_helper.dart';
import 'add_note_bloc.dart';
import 'add_note_sevent.dart';

class AddNoteController {
  static addNotecontroller(String note, BuildContext context) {
    if (note == "") {
      return UiHelper.CustomSnackBar(context, "Please Enter a Note");
    } else {
      BlocProvider.of<AddNoteBloc>(context).add(AddUserNotesEvents(note: note));
    }
  }
}
