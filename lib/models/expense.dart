import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category {
  food,
  // transportation,
  // housing,
  // health,
  leisure,
  // education,
  travel,
  work,
  other
}

const categoryIcons = {
  Category.food: Icons.fastfood,
  // Category.transportation: Icons.directions_bus,
  // Category.housing: Icons.home,
  // Category.health: Icons.local_hospital,
  Category.leisure: Icons.movie,
  // Category.education: Icons.menu_book,
  Category.travel: Icons.flight,
  Category.work: Icons.work,
  Category.other: Icons.attach_money,
};

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  final Category category;
  final List<Expense> expenses;

  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
