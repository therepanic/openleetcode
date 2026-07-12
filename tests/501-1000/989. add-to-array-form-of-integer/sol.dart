class Solution {
  List<int> addToArrayForm(List<int> num, int k) {
    final out = <int>[];
    var i = num.length - 1;
    var carry = k;
    while (i >= 0 || carry > 0) {
      if (i >= 0) {
        carry += num[i];
        i--;
      }
      out.add(carry % 10);
      carry ~/= 10;
    }
    if (out.isEmpty) {
      return [0];
    }
    return out.reversed.toList();
  }
}
