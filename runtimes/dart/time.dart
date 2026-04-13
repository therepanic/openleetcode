import 'dart:mirrors';

${SOLUTION}

${JSON_GEN}

void main() {
  final start = DateTime.now().millisecondsSinceEpoch;
  ${CALL_SOLUTION};
  final end = DateTime.now().millisecondsSinceEpoch;
  print(end - start);
}
