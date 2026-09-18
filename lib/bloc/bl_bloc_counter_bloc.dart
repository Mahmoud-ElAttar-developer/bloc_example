import 'package:flutter_bloc/flutter_bloc.dart';
import 'bl_bloc_counter_state.dart';
import 'events.dart';

class BlBlocCounterBloc extends Bloc<BlBlocCounterEvent, BlBlocCounterState> {
  BlBlocCounterBloc() : super(BlBlocCounterState().init()) {
    
    // تسجيل الـ InitEvent بالطريقة الحديثة
    on<InitEvent>((event, emit) async {
      final newState = await init();
      emit(newState);
    });

    // تسجيل الـ CounterIncrementEvent بالطريقة الحديثة
    on<CounterIncrementEvent>((event, emit) {
      emit(increment());
    });
  }

  Future<BlBlocCounterState> init() async {
    return state.clone();
  }

  BlBlocCounterState increment() {
    state.count = state.count + 1;
    return state.clone();
  }
}
