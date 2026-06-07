class Solution {
  String addBinary(String a, String b) {
    var i = a.length - 1;
    var j = b.length - 1;
    var carry = 0;
    final chars = <String>[];

    while (i >= 0 || j >= 0 || carry > 0) {
      var sum = carry;
      if (i >= 0) {
        sum += a.codeUnitAt(i) - 48;
        i--;
      }
      if (j >= 0) {
        sum += b.codeUnitAt(j) - 48;
        j--;
      }
      chars.add(String.fromCharCode(48 + (sum % 2)));
      carry = sum ~/ 2;
    }

    return chars.reversed.join();
  }
}
