import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hubtel_assessment/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.mtnMobileMoney3x).existsSync(), isTrue);
    expect(File(Images.absa3x).existsSync(), isTrue);
  });
}
