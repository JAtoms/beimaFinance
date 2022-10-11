// To parse this JSON data, do
//
//     final historyModel = historyModelFromJson(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

enum HistoryType { deposit, interest, withdrawal }

HistoryModel historyModelFromJson(String str) =>
    HistoryModel.fromJson(json.decode(str));

class HistoryModel {
  HistoryModel({
    required this.history,
  });

  final List<History> history;

  factory HistoryModel.fromJson(Map<String, dynamic> json) =>
      HistoryModel(
        history: List<History>.from(
            json['data'].map((x) => History.fromJson(x))),
      );
}

class History {
  History({
    required this.amount,
    required this.status,
    required this.id,
    required this.type,
    required this.user,
    required this.plan,
    required this.createdAt,
  });

  final Amount amount;
  final String status;
  final String id;
  final String type;
  final String user;
  final String plan;
  final String createdAt;


  factory History.fromJson(Map<String, dynamic> json) =>
      History(
        amount: Amount.fromJson(json['amount']),
        status: json['status'],
        id: json['_id'],
        type: json['type'],
        user: json['user'],
        plan: json['plan'],
        createdAt: DateFormat('EEE, MMM d, ' 'yy : hh:mm').format(DateTime.tryParse(json['createdAt'])!) ,
      );

}

class Amount {
  Amount({
    required this.valueInUsd,
    required this.value,
    required this.currency,
  });

  final int valueInUsd;
  final int value;
  final String currency;

  factory Amount.fromJson(Map<String, dynamic> json) =>
      Amount(
        valueInUsd: json['valueInUSD'],
        value: json['value'],
        currency: json['currency'],
      );

  Map<String, dynamic> toJson() =>
      {
        'valueInUSD': valueInUsd,
        'value': value,
        'currency': currency,
      };
}
