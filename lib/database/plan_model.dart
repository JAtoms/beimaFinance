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
  Plans({
    required this.amountSaved,
    required this.id,
    required this.name,
    required this.dueDate,
    required this.savingsPerMonth,
    required this.userId,
  });

  final int amountSaved;
  final String id;
  final String name;
  final String dueDate;
  final int savingsPerMonth;
  final String userId;

  factory Plans.fromJson(Map<String, dynamic> json) => Plans(
        amountSaved: json['amountSaved'],
        id: json['_id'],
        name: json['name'],
        dueDate: json['dueDate'],
        savingsPerMonth: json['savingsPerMonth'],
        userId: json['user_id'],
      );

  Map<String, dynamic> toJson() => {
        'amountSaved': amountSaved,
        '_id': id,
        'name': name,
        'dueDate': dueDate,
        'savingsPerMonth': savingsPerMonth,
        'user_id': userId,
      };
}
