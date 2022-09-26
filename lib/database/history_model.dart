enum HistoryType { deposit, interest, withdrawal }

class HistoryModel {
  HistoryType historyType;
  double amount;
  String date;

  HistoryModel(
      {required this.historyType, required this.amount, required this.date});

  static var history = [
    HistoryModel(
        historyType: HistoryType.deposit, amount: 15000, date: '20-09-22:08:30 AM'),
    HistoryModel(
        historyType: HistoryType.withdrawal, amount: 1000, date: '20-09-22:08:30 AM'),
    HistoryModel(
        historyType: HistoryType.interest, amount: 300, date: '20-09-22:08:30 AM'),
    HistoryModel(
        historyType: HistoryType.withdrawal, amount: 500, date: '20-09-22:08:30 AM'),
    HistoryModel(
        historyType: HistoryType.interest, amount: 200, date: '20-09-22:08:30 AM'),
    HistoryModel(
        historyType: HistoryType.interest, amount: 800, date: '20-09-22:08:30 AM'),
    HistoryModel(
        historyType: HistoryType.deposit, amount: 38000, date: '20-09-22:08:30 AM'),
  ];
}
