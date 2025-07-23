import 'dart:io';

// Função para ler um número do usuário, com tratamento de erro e opção de sair
double? lerNumero(String mensagem) {
  print(mensagem);
  var entrada = stdin.readLineSync();
  if (entrada == null || entrada.toLowerCase() == 'sair') return null;
  var numero = double.tryParse(entrada);
  if (numero == null) {
    print('Número inválido.');
    return lerNumero(mensagem); // Tenta novamente se inválido
  }
  return numero;
}

// Função para ler a operação desejada, com validação
String? lerOperacao(List<String> operacoes) {
  print('Digite a operação $operacoes (ou "sair" para encerrar):');
  var operacao = stdin.readLineSync();
  if (operacao == null || operacao.toLowerCase() == 'sair') return null;
  if (!operacoes.contains(operacao)) {
    print('Operação inválida.');
    return lerOperacao(operacoes); // Tenta novamente se inválida
  }
  return operacao;
}

void main() {
  print('---Calculadora Simples---');
  List<String> operacoes = ['+', '-', '*', '/'];
  List<String> historico = []; // Lista para armazenar o histórico

  while (true) {
    // Lê o primeiro número
    var num1 = lerNumero('Digite o número 1 (ou "sair" para encerrar):');
    if (num1 == null) break;

    // Lê a operação
    var operacao = lerOperacao(operacoes);
    if (operacao == null) break;

    // Lê o segundo número
    var num2 = lerNumero('Digite o número 2 (ou "sair" para encerrar):');
    if (num2 == null) break;

    double? resultado;
    // Realiza a operação escolhida
    switch (operacao) {
      case '+':
        resultado = num1 + num2;
        break;
      case '-':
        resultado = num1 - num2;
        break;
      case '*':
        resultado = num1 * num2;
        break;
      case '/':
        if (num2 == 0) {
          print('Erro: Divisão por zero não é permitida.');
        } else {
          resultado = num1 / num2;
        }
        break;
    }

    // Exibe o resultado e salva no histórico, se houver resultado
    if (resultado != null) {
      String operacaoResultado = '$num1 $operacao $num2 = $resultado';
      print('Resultado: $resultado');
      historico.add(operacaoResultado);
    }
    print('-----------------------------');
    print('Histórico:');
    historico.forEach(print); // Mostra o histórico de operações
    print('-----------------------------');
  }
  print('\nCalculadora encerrada.');
}
