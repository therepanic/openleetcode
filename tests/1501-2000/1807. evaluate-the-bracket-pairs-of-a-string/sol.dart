class Solution {
  String evaluate(String s, List<List<String>> knowledge) {
    final mp = {for (var pair in knowledge) pair[0]: pair[1]};
    var ans = '';
    var i = 0;
    final n = s.length;
    while (i < n) {
      if (s[i] == '(') {
        i++;
        var temp = '';
        while (i < n && s[i] != ')') {
          temp += s[i];
          i++;
        }
        ans += mp[temp] ?? '?';
        i++;
      } else {
        ans += s[i];
        i++;
      }
    }
    return ans;
  }
}
