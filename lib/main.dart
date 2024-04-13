import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hubtel_assessment/components/transaction_date_view.dart';
import 'package:hubtel_assessment/components/transaction_tag_view.dart';
import 'package:hubtel_assessment/resources/resources.dart';

import 'components/transaction_card_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hubtel Assessment',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          showSelectedLabels: false,
          backgroundColor: Colors.red,
          items: [
            BottomNavigationBarItem(icon: SvgPicture.asset(Svgs.homeIcon), label: 'Home'),
            BottomNavigationBarItem(icon: SvgPicture.asset(Svgs.scheduleIcon), label: 'Send'),
            BottomNavigationBarItem(icon: SvgPicture.asset(Svgs.historyIcon), label: 'History'),
            BottomNavigationBarItem(icon: SvgPicture.asset(Svgs.scheduleIcon), label: 'Scheduled'),
          ]),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(17),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CustomSlidingSegmentedControl<int>(
              isStretch: true,
              initialValue: 2,
              children: {
                2: const Text('History', style: TextStyle(fontWeight: FontWeight.w700)),
                3: Text(
                  'Transaction Summary',
                  style: TextStyle(color: Colors.black.withOpacity(0.2)),
                ),
              },
              decoration: BoxDecoration(
                color: CupertinoColors.lightBackgroundGray,
                borderRadius: BorderRadius.circular(8),
              ),
              thumbDecoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.3),
                    blurRadius: 4.0,
                    spreadRadius: 1.0,
                    offset: const Offset(
                      0.0,
                      2.0,
                    ),
                  ),
                ],
              ),
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInToLinear,
              onValueChanged: (v) {
                print(v);
              },
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                        filled: true,
                        fillColor: const Color(0xffE6EAED),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SvgPicture.asset(Svgs.searchIcon),
                        ),
                        hintText: 'Search',
                        hintStyle: const TextStyle(color: Color(0xff9CABB8), fontSize: 14)),
                  ),
                ),
                IconButton(onPressed: () {}, icon: SvgPicture.asset(Svgs.filterIcon))
              ],
            ),
            const SizedBox(height: 31),
            const TransactionDateView(date: 'May 24, 2022'),
            const SizedBox(height: 16),
            const TransactionCardView(
                timestamp: '14:45PM',
                transactionStatus: TransactionStatus.success,
                logo: Images.mtnMobileMoney3x,
                amount: 'GHS 500',
                name: 'Emmanuel Rockson Kwabena Uncle Ebo'),
            const TransactionCardView(
              timestamp: '14:45PM',
              hasStar: false,
              logo: Images.absa3x,
              name: 'Absa Bank',
              amount: 'GHS 500',
              transactionStatus: TransactionStatus.failed,
            ),
            const SizedBox(height: 16),
            const TransactionDateView(date: 'May 23, 2022'),
            const SizedBox(height: 16),
            const TransactionCardView(
                timestamp: '14:45PM',
                transactionStatus: TransactionStatus.success,
                logo: Images.mtnMobileMoney3x,
                amount: 'GHS 500',
                name: 'Emmanuel Rockson Kwabena Uncle Ebo'),
          ]),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xff01C7B1),
        onPressed: () {},
        tooltip: 'Send new',
        icon: const Card(
            elevation: 0,
            child: Padding(
              padding: EdgeInsets.all(3.0),
              child: Icon(Icons.add, color: Color(0xff01C7B1)),
            )),
        label: const Text('SEND NEW',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
      ),
    );
  }
}
