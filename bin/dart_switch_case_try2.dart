import 'dart:io';

void main() {
  BankAccount account = BankAccount(1000.0);
  processOperation(account);
  stdout.write('Введите номер  задания : ');
  int numTask = int.tryParse(stdin.readLineSync() ?? "") ?? 0;
  switch (numTask) {
    case 1:
      task1();
      break;
      case 2:
      task2();
      break;
      case 3:
      task3();
      break;
  }
}

void task1() {
  stdout.write('Введите сумму дохода: ');
  String userInput = stdin.readLineSync()!;
  double income = double.parse(userInput);

  double taxPercent;
  if (income <= 10000) {
    taxPercent = 0.0;
  } else if (income <= 50000) {
    taxPercent = 0.10;
  } else {
    taxPercent = 0.12;
  }

  double taxAmount = income * taxPercent;

  print('Сумма дохода: \$${income.toStringAsFixed(2)}');
  print('Процент налога: ${(taxPercent * 100).toStringAsFixed(2)}%');
  print('Сумма налога: \$${taxAmount.toStringAsFixed(2)}');
}

void task2() {
  stdout.write('Введите первое число: ');
  double num1 = double.parse(stdin.readLineSync()!);

  stdout.write('Введите оператор (+, -, *, /): ');
  String operator = stdin.readLineSync()!;

  stdout.write('Введите второе число: ');
  double num2 = double.parse(stdin.readLineSync()!);

  double result;
  switch (operator) {
    case '+':
      result = num1 + num2;
      break;
    case '-':
      result = num1 - num2;
      break;
    case '*':
      result = num1 * num2;
      break;
    case '/':
      if (num2 != 0) {
        result = num1 / num2;
      } else {
        print('Ошибка: деление на ноль!');
        return;
      }
      break;
    default:
      print('Ошибка: некорректный оператор!');
      return;
  }

  print('Результат: $num1 $operator $num2 = $result');
}

void task3() {
  stdout.write('Введите расширение файла (например, ".txt", ".jpg", ".pdf"): ');
  String fileExtension = stdin.readLineSync()!;

  String fileType;
  switch (fileExtension) {
    case '.txt':
      fileType = 'Текстовый файл';
      break;
    case '.jpg':
    case '.png':
    case '.gif':
      fileType = 'Изображение';
      break;
    case '.pdf':
      fileType = 'Документ';
      break;
    default:
      fileType = 'Неизвестный тип файла';
  }

  print('Тип файла с расширением $fileExtension: $fileType');
}

class BankAccount {
  late double balance;

  BankAccount(double initialBalance) {
    balance = initialBalance;
  }

  void deposit(double amount) {
    balance += amount;
  }

  void withdraw(double amount) {
    if (amount <= balance) {
      balance -= amount;
    } else {
      print('Ошибка: Недостаточно средств на счете.');
    }
  }

  void checkBalance() {
    print('Текущий баланс: \$${balance.toStringAsFixed(2)}');
  }

  void closeAccount() {
    print('Счет закрыт. Остаток: \$${balance.toStringAsFixed(2)}');
    exit(0);
  }
}

void processOperation(BankAccount account) {
  stdout.write(
      'Выберите операцию (1 - Депозит, 2 - Снятие, 3 - Запрос баланса, 4 - Закрытие счета): ');
  String choice = stdin.readLineSync()!;

  switch (choice) {
    case '1':
      stdout.write('Введите сумму для депозита: ');
      double depositAmount = double.parse(stdin.readLineSync()!);
      account.deposit(depositAmount);
      break;
    case '2':
      stdout.write('Введите сумму для снятия: ');
      double withdrawAmount = double.parse(stdin.readLineSync()!);
      account.withdraw(withdrawAmount);
      break;
    case '3':
      account.checkBalance();
      break;
    case '4':
      account.closeAccount();
      break;
    default:
      print('Ошибка: Некорректная операция.');
      break;
  }

  processOperation(
      account); // Рекурсивный вызов для обработки следующей операции
}
