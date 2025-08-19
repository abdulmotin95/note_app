import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/apihelper.dart';
import '../../../data/baseurl.dart';
import '../../../domains/constans/app_prefs.dart';
import '../../../domains/model/add_note_model.dart';
import 'add_note_sevent.dart';
import 'add_note_states.dart';

class AddNoteBloc extends Bloc<AddNotesEvents, AddNotesStates> {
  ApiHelper apiHelper;
  AddNoteBloc({required this.apiHelper}) : super(AddNotesInitialState()) {
    on<AddUserNotesEvents>((event, emit) async {
      emit(AddNotesLoadingState());
      try {
        final userid = await AppPrefs().getuserId();
        final response = await apiHelper.postapi(
          url: BaseUrls.addnote,
          bodyparams: {"userid": userid, "note": event.note},
          isheaderrequired: true,
        );
        final noteModel = AddNoteModel.fromJson(response);
        emit(AddNotesLoadedState(addNoteModel: noteModel));
      } catch (ex) {
        emit(AddNoteErrorState(error: ex.toString()));
      }
    });
  }
}
