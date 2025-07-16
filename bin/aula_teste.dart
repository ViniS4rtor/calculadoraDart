import 'dart:io';

void main(List<String> arguments) {
  print('---Calculadora Simples---');
  while (true) {
    print('Digite o número 1 (ou "sair" para encerrar):');
    var entrada1 = stdin.readLineSync();
    if (entrada1 == null || entrada1.toLowerCase() == 'sair') break;
    var num1 = double.tryParse(entrada1);
    if (num1 == null) {
      print('Número inválido.');
      continue;
    }

    List<String> operacoes = ['+', '-', '*', '/'];
    print('Digite a operação $operacoes (ou "sair" para encerrar):');
    var operacao = stdin.readLineSync();
    if (operacao == null || operacao.toLowerCase() == 'sair') break;

    print('Digite o número 2 (ou "sair" para encerrar):');
    var entrada2 = stdin.readLineSync();
    if (entrada2 == null || entrada2.toLowerCase() == 'sair') break;
    var num2 = double.tryParse(entrada2);
    if (num2 == null) {
      print('Número inválido.');
      continue;
    }

    if (operacao != '+' &&
        operacao != '-' &&
        operacao != '*' &&
        operacao != '/') {
      print('Operação inválida. Digitou duas operações ou mais.');
      continue;
    }

    switch (operacao) {
      case '+':
        print('Resultado: ${num1 + num2}');
        break;
      case '-':
        print('Resultado: ${num1 - num2}');
        break;
      case '*':
        print('Resultado: ${num1 * num2}');
        break;
      case '/':
        if (num2 == 0) {
          print('Erro: Divisão por zero não é permitida.');
        } else {
          print('Resultado: ${num1 / num2}');
        }
        break;
      default:
        print('Operação inválida');
    }
    print('-----------------------------');
  }
  print('Calculadora encerrada.');
}
