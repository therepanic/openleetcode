class Solution {
  String multiply(String num1, String num2) {
    final n = num1.length;
    final m = num2.length;
    final result = List<int>.filled(n + m, 0);

    for (var i = n - 1; i >= 0; i--) {
      for (var j = m - 1; j >= 0; j--) {
        final mul = (num1.codeUnitAt(i) - 48) * (num2.codeUnitAt(j) - 48);
        final sum = mul + result[i + j + 1];
        result[i + j + 1] = sum % 10;
        result[i + j] += sum ~/ 10;
      }
    }

    var k = 0;
    while (k < result.length && result[k] == 0) {
      k++;
    }
    if (k == result.length) {
      return "0";
    }

    final out = StringBuffer();
    for (var i = k; i < result.length; i++) {
      out.write(result[i]);
    }
    return out.toString();
  }
}
