class Solution {
  String interpret(String command) {
    final result = StringBuffer();
    var i = 0;
    while (i < command.length) {
      if (command[i] == 'G') {
        result.write('G');
        i++;
      } else if (command.substring(i, i + 2) == '()') {
        result.write('o');
        i += 2;
      } else {
        result.write('al');
        i += 4;
      }
    }
    return result.toString();
  }
}
