class Solution {
  List<String> generateParenthesis(int n) {
    final res = <String>[];
    var cur = '';
    _gen(0, 0, n, cur, res);
    return res;
  }

  void _gen(int open, int close, int n, String cur, List<String> res) {
    if (open == n && close == n) {
      res.add(cur);
      return;
    }
    if (open < n) {
      _gen(open + 1, close, n, cur + '(', res);
    }
    if (close < open) {
      _gen(open, close + 1, n, cur + ')', res);
    }
  }
}
