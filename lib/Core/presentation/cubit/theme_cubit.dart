import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskati/Core/Services/hive_helper.dart';
import 'package:taskati/Core/presentation/cubit/theme_state.dart';

class ThemeCubit extends Cubit<ThemeState>{
  ThemeCubit() : super(ThemeInitialState());

bool isDarkMode = HiveHelper.getData( HiveHelper.isDarkModeKey) == true;
  void updateTheme(){
    isDarkMode = ! isDarkMode;
    HiveHelper.cacheData(HiveHelper.isDarkModeKey, isDarkMode);
    emit(ThemeUpdatedState());
  }
}