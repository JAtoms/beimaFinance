// To parse this JSON data, do
//
//     final planModel = planModelFromJson(jsonString);

import 'dart:convert';

enum PlanType { flexible, retirement, threeyrs, tenyrs }

PlanModel planModelFromJson(String str) => PlanModel.fromJson(json.decode(str));

String planModelToJson(PlanModel data) => json.encode(data.toJson());

class PlanModel {
  PlanModel({
    required this.data,
  });

  final List<Plans> data;

  factory PlanModel.fromJson(Map<String, dynamic> json) => PlanModel(
        data: List<Plans>.from(json['data'].map((x) => Plans.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'data': List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Plans {
  Plans(
      {required this.savingsPerMonth,
      required this.amountSaved,
      required this.interestAccrued,
      required this.bimTokens,
      required this.id,
      required this.name,
      required this.dueDate,
      required this.user,
      required this.apr,
      required this.createdAt,
      required this.updatedAt});

  final SavingsPerMonth savingsPerMonth;
  final int amountSaved;
  final int interestAccrued;
  final int bimTokens;
  final String id;
  final String name;
  final DateTime dueDate;
  final String user;
  final int apr;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Plans.fromJson(Map<String, dynamic> json) => Plans(
      savingsPerMonth: SavingsPerMonth.fromJson(json['savingsPerMonth']),
      amountSaved: json['amountSaved'],
      interestAccrued: json['interestAccrued'],
      bimTokens: json['bimTokens'],
      id: json['_id'],
      name: json['name'],
      dueDate: DateTime.parse(json['dueDate']),
      user: json['user'],
      apr: json['apr'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']));

  Map<String, dynamic> toJson() => {
        'savingsPerMonth': savingsPerMonth.toJson(),
        'amountSaved': amountSaved,
        'interestAccrued': interestAccrued,
        'bimTokens': bimTokens,
        '_id': id,
        'name': name,
        'dueDate': dueDate.toIso8601String(),
        'user': user,
        'apr': apr,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String()
      };
}

class SavingsPerMonth {
  SavingsPerMonth({
    required this.valueInUsd,
    required this.value,
    required this.currency,
  });

  final int valueInUsd;
  final int value;
  final String currency;

  factory SavingsPerMonth.fromJson(Map<String, dynamic> json) =>
      SavingsPerMonth(
        valueInUsd: json['valueInUSD'],
        value: json['value'],
        currency: json['currency'],
      );

  Map<String, dynamic> toJson() => {
        'valueInUSD': valueInUsd,
        'value': value,
        'currency': currency,
      };
}
