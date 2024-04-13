import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hubtel_assessment/resources/resources.dart';

enum TransactionStatus { failed, success }

class TransactionTagView extends StatelessWidget {
  final TransactionStatus status;
  const TransactionTagView({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return status == TransactionStatus.success
        ? Card(
            elevation: 0,
            color: const Color(0xffDBF7E0),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Row(
                children: [
                  SvgPicture.asset(Svgs.success),
                  const SizedBox(width: 6),
                  const Text('Successful',
                      style: TextStyle(
                          fontSize: 10, fontWeight: FontWeight.w700, color: Color(0xff70E083))),
                ],
              ),
            ),
          )
        : Card(
            elevation: 0,
            color: const Color(0xffFDB0AC),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Row(
                children: [
                  SvgPicture.asset(Svgs.failed),
                  const SizedBox(width: 6),
                  const Text('Failed',
                      style: TextStyle(
                          fontSize: 10, fontWeight: FontWeight.w700, color: Color(0xff99231D))),
                ],
              ),
            ),
          );
  }
}
