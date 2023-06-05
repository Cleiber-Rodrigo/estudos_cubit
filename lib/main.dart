import 'package:estudos_cubit/cubit/greeting_cubit.dart';
import 'package:estudos_cubit/cubit/greeting_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark
      ),
      home: BlocProvider<GreetingCubit>(
        create: (context) => GreetingCubit(),
        child: const Home(),
      )
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextMessage(),
            //Cada vez que o usuário pressionar o botão, vai mudar o estado
            TextButton(
                onPressed: (){
                  final greetingCubit = context.read<GreetingCubit>();
                  greetingCubit.getNextGreetingState();
                },
                child: const Text("Próxima visita")
            ),
            //Esse botão ao ser pressionado, zera o contador e emite o estado inicial
            TextButton(
                onPressed: (){
                  final greetingCubit = context.read<GreetingCubit>();
                  greetingCubit.resetCountig();
                },
                child: const Text("Zerar contagem")
            )
          ],
        )
      ),
    );
  }
}

  class TextMessage extends StatelessWidget {
    const TextMessage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return BlocBuilder<GreetingCubit, GreetingState>(
          builder: (context, state) {

            String message = '';

            if (state is GreetingInitial) {
              message = "Bem vindo";
            } else if (state is GreetingSecondTime) {
              message = "É seu segundo acesso";
            } else if (state is GreetingThirdTime) {
              message = "É seu terceiro acesso";
            } else if (state is GreetingThereafter) {
              message = "Bem vindo novamente";
            }

            return Text(
              message,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            );
          }
      );
    }
  }


/*  floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      )
*/
