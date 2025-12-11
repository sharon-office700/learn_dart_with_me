// Create a file exercise_1_4.dart implementing a banking system with: - Abstract Account class - CheckingAccount and SavingsAccount subclasses - InterestBearing mixin for savings accounts - Transaction tracking


abstract class Account {
  String createAccount();
}

mixin InterestBearing {

  int isFresh( int? account_created) {
    return account_created ?? DateTime.now().year;
  }

  bool valid_year(int year) {
    // if (year - 2000 > 25) {
    //   print("account creation date can\'t be earlier than bank foundation year: 2000");
    //   return false;
    // }
    String str_year = year.toString();
    if ((str_year.length == 4) && (year - 2000 < 25)) {
      return true;
    } else {
      print("invalid year entered : $year");
      return false;
    }
  }

  int calculate_interest(int principal, tenure) {
    if (valid_year(tenure)) {
      return (principal * 6 * tenure) ~/ 100;
    } else {
      throw Exception("$tenure is an invalid given year");
      // return 0;
    }
  }

}


class CheckingAccount with InterestBearing implements Account {
  String name;
  int balance;
  int? account_created;

  CheckingAccount({required this.name, required this.balance, this.account_created}) {
    this.account_created = isFresh(this.account_created);
  }



  @override
  String createAccount() {
    if (this.balance != 0) {
      return "Thank you for creating a new CheckingAccount, ${this.name}";
    } else {
      return "${this.name} has created an CheckingAccount with starting balance of ${this.balance}";
    }
  }
}



class SavingsAccount with InterestBearing implements Account {
  String name;
  int balance;
  int? account_created;
  int _roi = 6;

  int get roi {
    return _roi;
  }

  SavingsAccount({required this.name, required this.balance, this.account_created}) {
    this.account_created = isFresh(account_created);
  }

  // @override
  // int calculate_interest(int principal, roi, tenure) {
  //   return super.calculate_interest(principal, roi, tenure);
  // }

  @override
  String createAccount() {
    if (this.balance != 0) {
      return "Thank you for creating a new SavingsAccount, ${this.name}";
    } else {
      return "${this.name} has created an SavingsAccount with starting balance of ${this.balance}";
    }
  }
}



void main() {

  CheckingAccount chk_acc1 = CheckingAccount(name: "sonu", balance: 1000);
  CheckingAccount chk_acc2 = CheckingAccount(name: "another_sonu", balance: 1000, account_created: 1998);
  CheckingAccount sav_acc = CheckingAccount(name: "sharon", balance: 1000, account_created: 1998);
  print(chk_acc1.account_created);
  print(chk_acc2.isFresh(chk_acc2.account_created));

  print("--------------");
  print(" interest amount == ${sav_acc.calculate_interest(100, 2022)}");


}