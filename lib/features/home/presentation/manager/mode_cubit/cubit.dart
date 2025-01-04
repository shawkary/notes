import 'package:bee_2/constants.dart';
import 'package:bee_2/core/shared_preference.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'state.dart';

class ModeCubit extends Cubit<ModeState> {
  ModeCubit() : super(InitialModeCubitState());

  void changeMode() {
    isDark = !isDark;
    CacheHelper.saveBool('isDark', isDark);
    emit(HomeChangeModeState());
  }
}
