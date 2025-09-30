import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper/custom_logger.dart';

class CustomBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    // print('onEvent -- ${bloc.runtimeType}, $event');
    CustomLogger.blue('onEvent -- ${bloc.runtimeType}, $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    // print('onChange -- ${bloc.runtimeType}, $change');
    CustomLogger.green('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    // print('onTransition -- ${bloc.runtimeType}, $transition');
    CustomLogger.yellow('onTransition -- ${bloc.runtimeType}, $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // print('onError -- ${bloc.runtimeType}, $error');
    CustomLogger.red('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }
}
