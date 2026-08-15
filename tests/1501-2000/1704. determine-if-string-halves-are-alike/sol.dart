class Solution {
  bool halvesAreAlike(String s) {
    final vowels = 'aeiouAEIOU';
    final mid = s.length ~/ 2;
    var count = 0;
    for (var i = 0; i < mid; i++) {
      if (vowels.contains(s[i])) count++;
    }
    for (var i = mid; i < s.length; i++) {
      if (vowels.contains(s[i])) count--;
    }
    return count == 0;
  }
}
