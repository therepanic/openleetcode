class Solution {
  bool isAdditiveNumber(String num) {
    String addStrings(String a, String b) {
      int i = a.length - 1, j = b.length - 1, carry = 0;
      final out = <int>[];
      while (i >= 0 || j >= 0 || carry != 0) {
        int sum = carry;
        if (i >= 0) sum += a.codeUnitAt(i--) - 48;
        if (j >= 0) sum += b.codeUnitAt(j--) - 48;
        out.add(48 + (sum % 10));
        carry = sum ~/ 10;
      }
      return String.fromCharCodes(out.reversed);
    }

    final n = num.length;
    for (int i = 1; i < n; i++) {
      if (num[0] == '0' && i > 1) break;
      for (int j = i + 1; j < n; j++) {
        if (num[i] == '0' && j > i + 1) break;
        var a = num.substring(0, i);
        var b = num.substring(i, j);
        var k = j;
        var used = 2;
        while (k < n) {
          final c = addStrings(a, b);
          if (k + c.length > n || num.substring(k, k + c.length) != c) break;
          k += c.length;
          a = b;
          b = c;
          used++;
        }
        if (k == n && used >= 3) return true;
      }
    }
    return false;
  }
}
