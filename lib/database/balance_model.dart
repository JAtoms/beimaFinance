enum BalanceType { amountSaved, interest, reward }

class BalanceModel {
  BalanceType balanceType;
  double amount;
  String other;

  BalanceModel(
      {required this.balanceType, required this.amount, required this.other});

  static var balances = [
    BalanceModel(
        balanceType: BalanceType.amountSaved, amount: 0, other: ''),
    BalanceModel(balanceType: BalanceType.interest, amount: 0, other: ''),
    BalanceModel(balanceType: BalanceType.reward, amount: 0, other: ''),
  ];
}
