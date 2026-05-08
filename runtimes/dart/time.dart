import 'dart:mirrors';
import 'dart:math';
import 'dart:collection';
import 'dart:io';

${SOLUTION}

${UTILITIES}

void main() {
  final start = Stopwatch()..start();
  ${CALL_SOLUTION};
  start.stop();
  print(start.elapsedMilliseconds);
}
