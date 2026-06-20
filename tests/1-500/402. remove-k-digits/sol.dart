class Solution {
  String removeKdigits(String num, int k) {
    List<String> s = [];
    for (var c in num.split('')) {
      while (k > 0 && s.isNotEmpty && s.last.compareTo(c) > 0) {
        s.removeLast();
        k--;
      }
      s.add(c);
    }
    
    s = s.sublist(0, s.length - k);
    String result = s.join().replaceFirst(RegExp(r'^0+'), '');
    return result.isEmpty ? '0' : result;
  }
}
