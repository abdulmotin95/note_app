import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/apihelper.dart';
import '../../../data/baseurl.dart';
import '../../../domains/constans/app_prefs.dart';
import '../../../domains/model/fetch_note_model.dart';
import 'fetch_note_state.dart';
import '../../../domains/constans/app_exception.dart';
import 'dart:io';

class FetchNotesCubit extends Cubit<FetchNotesStates> {
  final ApiHelper apiHelper;

  FetchNotesCubit({required this.apiHelper}) : super(FetchNotesInitialStates());

  fetchNotes() async {
    emit(FetchNotesLoadingStates());
    try {
      String userid = await AppPrefs().getuserId();

      if (userid.isEmpty) {
        emit(FetchNotesErrorStates(error: "User ID not found"));
        return;
      }

      final response = await apiHelper.postapi(
        url: BaseUrls.fetchnote,
        isheaderrequired: true,
        bodyparams: {"userid": userid},
      );

      final fetchnotemodel = FetchNoteModel.fromJson(response);
      emit(FetchNotesLoadedStates(fetchNoteModel: fetchnotemodel));
    } catch (ex) {
      String errorMessage;

      if (ex is FetchDataException) {
        errorMessage = "Network Error: ${ex.errormsg}";
      } else if (ex is BadRequestException) {
        errorMessage = "Bad Request: ${ex.errormsg}";
      } else if (ex is SocketException) {
        errorMessage = "No Internet Connection";
      } else {
        errorMessage = "Unexpected Error: ${ex.toString()}";
      }

      emit(FetchNotesErrorStates(error: errorMessage));
    }
  }
}
