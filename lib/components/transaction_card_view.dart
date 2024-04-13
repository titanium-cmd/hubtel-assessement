import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hubtel_assessment/components/transaction_tag_view.dart';
import 'package:hubtel_assessment/resources/resources.dart';

class TransactionCardView extends StatelessWidget {
  final String logo, timestamp, name, amount;
  final bool? hasStar;
  final TransactionStatus transactionStatus;
  const TransactionCardView({
    super.key,
    required this.logo,
    required this.timestamp,
    required this.name,
    this.hasStar = true,
    required this.amount,
    required this.transactionStatus,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Card(
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: Color(0xffE6EAED)),
            borderRadius: BorderRadius.circular(10)),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(timestamp, style: const TextStyle(fontSize: 12, color: Color(0xff9CABB8))),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(logo, height: 39),
                  const SizedBox(width: 16),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name),
                      const Text('024 123 4567',
                          style: TextStyle(fontSize: 14, color: Color(0xff9CABB8)))
                    ],
                  )),
                  const SizedBox(width: 16),
                  Column(
                    children: [
                      TransactionTagView(status: transactionStatus),
                      Text(amount, style: const TextStyle(fontWeight: FontWeight.w800))
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
              const SizedBox(height: 8),
              const Divider(),
              const SizedBox(height: 8),
              Row(
                children: [
                  SvgPicture.asset(Svgs.person),
                  const SizedBox(width: 10),
                  const Text('Personal', style: TextStyle(fontSize: 12)),
                  const SizedBox(width: 5),
                  const Card(
                    elevation: 0,
                    shape: CircleBorder(),
                    color: Color(0xff9CABB8),
                    child: Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Text(''),
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Expanded(
                      child: Text('Cool your heart wai', style: TextStyle(fontSize: 12))),
                  hasStar! ? SvgPicture.asset(Svgs.star) : const SizedBox(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
