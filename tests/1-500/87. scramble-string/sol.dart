class Solution {
  final Map<String, bool> _memo = {};

  bool isScramble(String s1, String s2) {
    if (s1.length != s2.length) return false;
    _memo.clear();
    return _dfs(s1, s2);
  }

  bool _dfs(String a, String b) {
    if (a == b) return true;
    final key = '$a#$b';
    final cached = _memo[key];
    if (cached != null) return cached;
    final counts = List.filled(26, 0);
    for (var i = 0; i < a.length; i++) {
      counts[a.codeUnitAt(i) - 97]++;
      counts[b.codeUnitAt(i) - 97]--;
    }
    for (final x in counts) {
      if (x != 0) {
        _memo[key] = false;
        return false;
      }
    }
    for (var i = 1; i < a.length; i++) {
      if (_dfs(a.substring(0, i), b.substring(0, i)) && _dfs(a.substring(i), b.substring(i))) {
        _memo[key] = true;
        return true;
      }
      if (_dfs(a.substring(0, i), b.substring(b.length - i)) && _dfs(a.substring(i), b.substring(0, b.length - i))) {
        _memo[key] = true;
        return true;
      }
    }
    _memo[key] = false;
    return false;
  }
}
