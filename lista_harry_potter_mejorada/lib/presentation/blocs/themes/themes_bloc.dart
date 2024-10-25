import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lista_harry_potter_mejorada/presentation/blocs/themes/themes_event.dart';
import 'package:lista_harry_potter_mejorada/presentation/blocs/themes/themes_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState()) {
    on<ThemeChanged>(_onThemeChanged);
  }

  void _onThemeChanged(ThemeChanged event, Emitter<ThemeState> emit) {
    emit(state.copyWith(
      colorTheme: event.color,
      darkMode: event.darkmode
    ));
  }
}