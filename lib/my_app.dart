import 'package:bloc_sample_todo_app/bloc/counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => CounterBloc(),
          ),
          // BlocProvider(
          //   create: (_) => CounterCubit(),
          // ),
        ],
        child: SamplePage(),
      ),
      // home: BlocProvider<CounterCubit>(
      //   create: (context) => CounterCubit(),
      //   child: SamplePage(),
      // ),
    );
  }
}

class SamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('cubit first sample'),
      ),
      body: Text(context.watch<CounterBloc>().state.counter.toString()),
      // body: BlocBuilder<CounterCubit, CounterState>(
      //   builder: (context, state) {
      //     return Text(state.counter.toString());
      //   },
      // ),
      floatingActionButton: Row(
        children: [
          IconButton(
            onPressed: () {
              context.read<CounterBloc>().add(IncreaseCounterEvent());
            },
            icon: Icon(
              Icons.exposure_plus_1,
            ),
          ),
          IconButton(
            onPressed: () {
              context.read<CounterBloc>().add(DecreaseCounterEvent());
            },
            icon: Icon(
              Icons.exposure_minus_1,
            ),
          ),
        ],
      ),
    );
  }
}
