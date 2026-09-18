import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bl_bloc_counter_bloc.dart';
import 'bl_bloc_counter_state.dart';
import 'events.dart';

class BlBlocCounterPage extends StatelessWidget {
  const BlBlocCounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => BlBlocCounterBloc()..add(InitEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<BlBlocCounterBloc>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Bloc-Bloc Example')),
      body: Center(
        child: BlocBuilder<BlBlocCounterBloc, BlBlocCounterState>(
          builder: (context, state) {
            return Text(
              'Pressed ${state.count} times',
              style: const TextStyle(fontSize: 25.0),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => bloc.add(CounterIncrementEvent()),
        child: const Icon(Icons.add),
      ),
    );
  }
}
