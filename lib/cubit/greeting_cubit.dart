import 'package:bloc/bloc.dart';
import 'greeting_state.dart';

class GreetingCubit extends Cubit<GreetingState> {
  //A variável abaixo vai falar em qual estado estou. Poderia vir de um banco de dados
  //mas nesse caso vamos criar aqui mesmo, só pra facilitar
  int howManyTimes = 1;

  GreetingCubit() : super(GreetingInitial());

  //Método que incrementa a nossa variável howManyTimes, para mudar o estado
  Future<void> getNextGreetingState() async {
    howManyTimes++;

    if (howManyTimes == 2) {
      emit(GreetingSecondTime());
    } else if (howManyTimes == 3) {
      emit(GreetingThirdTime());
    }else {
      emit(GreetingThereafter());
    }
  }

  Future<void> resetCountig() async {
    howManyTimes = 1;
    emit(GreetingInitial());
  }

}
