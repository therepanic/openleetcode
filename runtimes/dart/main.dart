import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:mirrors';
import 'dart:math';
import 'dart:collection';
import 'dart:typed_data';
import 'package:collection/collection.dart';

${SOLUTION}

${UTILITIES}

late final Map<String, dynamic> _TEST_;

dynamic testVal(String caseId, String name) {
  return (_TEST_[caseId] as Map<String, dynamic>)[name]["val"];
}

void main() {
  _TEST_ = (jsonDecode(File('test.json').readAsStringSync()) as Map).cast<String, dynamic>();
  ${INSERTION}
}
