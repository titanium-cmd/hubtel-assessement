import 'package:flutter/material.dart';

class TransactionDateView extends StatelessWidget {
  final String date;
  const TransactionDateView({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      elevation: 0,
      color: const Color(0xffE6EAED),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          date,
          style:
              const TextStyle(color: Color(0xff9CABB8), fontSize: 10, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
