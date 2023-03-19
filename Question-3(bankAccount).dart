//Create a BankAccount class with balance and accountNumber properties, and methods called deposit() and withdraw() that
//modify the balance property. Then create a CheckingAccount class that inherits from BankAccount and has a transactionLimit property.
//Override the withdraw() method in the CheckingAccount class to check if the withdrawal amount is within the transaction limit before
//modifying the balance property.
void main() {
  BankAccount myAccount = BankAccount(0368820009, 0.0);

  myAccount.deposit(1000.0);
  print(
      "\nBalance of ${myAccount.accountNumber} After Deposit: ${myAccount.balance}");

  myAccount.withdraw(500.0);
  print(
      "\nBalance of ${myAccount.accountNumber} After Withdrawal: ${myAccount.balance}");

  CheckingAccount myChecking =
      CheckingAccount(0368820009, balance: 2000.0, transactionLimit: 9000.0);

  myChecking.deposit(3000.0);
  print(
      "\nChecking Balance of ${myAccount.accountNumber} After Deposit: ${myChecking.balance}");

  myChecking.withdraw(2000.0);
  print(
      "\nChecking Balance of ${myAccount.accountNumber} After Withdrawal: ${myChecking.balance}");

  myChecking.withdraw(1000.0);
  print(
      "\nChecking Balance of ${myAccount.accountNumber} After Over Limit Withdrawal: ${myChecking.balance}");
}

class BankAccount {
  int accountNumber;
  double balance;

  BankAccount(this.accountNumber, [this.balance = 0]);

  void deposit(double amount) {
    balance += amount;
  }

  void withdraw(double amount) {
    balance -= amount;
  }
}

class CheckingAccount extends BankAccount {
  double transactionLimit;

  CheckingAccount(int accountNumber,
      {double balance = 0, this.transactionLimit = 9000})
      : super(accountNumber, balance);

  void withdraw(double amount) {
    if (amount > transactionLimit) {
      print("Transaction Limit Exceeds.");
    } else {
      super.withdraw(amount);
    }
  }
}
