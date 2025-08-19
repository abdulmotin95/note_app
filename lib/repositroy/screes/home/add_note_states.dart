
import '../../../domains/model/add_note_model.dart';

abstract class AddNotesStates {}

class AddNotesInitialState extends AddNotesStates {}

class AddNotesLoadingState extends AddNotesStates {}

class AddNotesLoadedState extends AddNotesStates {
  AddNoteModel addNoteModel;
  AddNotesLoadedState({required this.addNoteModel});
}

class AddNoteErrorState extends AddNotesStates {
  String error;
  AddNoteErrorState({required this.error});
}
