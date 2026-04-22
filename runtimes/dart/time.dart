import 'dart:mirrors';

${SOLUTION}

${UTILITIES}

void main() {
  final start = DateTime.now().millisecondsSinceEpoch;
  ${CALL_SOLUTION};
  final end = DateTime.now().millisecondsSinceEpoch;
  print(end - start);
}
