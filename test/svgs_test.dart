import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hubtel_assessment/resources/resources.dart';

void main() {
  test('svgs assets test', () {
    expect(File(Svgs.group38547).existsSync(), isTrue);
    expect(File(Svgs.homeIcon).existsSync(), isTrue);
    expect(File(Svgs.failed).existsSync(), isTrue);
    expect(File(Svgs.filterIcon).existsSync(), isTrue);
    expect(File(Svgs.historyIcon).existsSync(), isTrue);
    expect(File(Svgs.person).existsSync(), isTrue);
    expect(File(Svgs.scheduleIcon).existsSync(), isTrue);
    expect(File(Svgs.searchIcon).existsSync(), isTrue);
    expect(File(Svgs.star).existsSync(), isTrue);
    expect(File(Svgs.success).existsSync(), isTrue);
  });
}
