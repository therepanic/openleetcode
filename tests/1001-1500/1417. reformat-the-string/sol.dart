class Solution {
  String reformat(String s) {
    List<String> digits = [];
    List<String> letters = [];
    for (var c in s.split('')) {
      if (RegExp(r'\d').hasMatch(c)) {
        digits.add(c);
      } else if (RegExp(r'[a-zA-Z]').hasMatch(c)) {
        letters.add(c);
      }
    }
    if ((digits.length - letters.length).abs() >= 2) {
      return "";
    }
    List<String> ans = List.filled(s.length, '');
    if (digits.length > letters.length) {
      for (int i = 0; i < s.length; i++) {
        ans[i] = i % 2 == 0 ? digits[i ~/ 2] : letters[i ~/ 2];
      }
    } else {
      for (int i = 0; i < s.length; i++) {
        ans[i] = i % 2 == 0 ? letters[i ~/ 2] : digits[i ~/ 2];
      }
    }
    return ans.join('');
  }
}
