import 'package:bee_2/constants.dart';
import 'package:bee_2/core/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

part 'state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  void removeNotes(int index) {
    stories.removeRange(index * 3, index * 3 + 3);
    CacheHelper.saveList('stories', stories);
    emit(HomeRemoveNoteState());
  }

  void addNotes({required String text, required String text2}) {
    stories.addAll([text, text2, '${DateFormat.MMMEd().format(DateTime.now())} (${DateFormat.Hm().format(DateTime.now())})']);
    CacheHelper.saveList('stories', stories);
    emit(HomeAddNoteState());
  }
}
