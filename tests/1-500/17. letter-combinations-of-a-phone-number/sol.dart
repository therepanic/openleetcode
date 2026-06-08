class Solution {
  List<String> letterCombinations(String digits) {
    if (digits.isEmpty) return [];
    const map = ['', '', 'abc', 'def', 'ghi', 'jkl', 'mno', 'pqrs', 'tuv', 'wxyz'];
    final res = <String>[];
    var cur = '';
    _dfs(digits, 0, map, cur, res);
    return res;
  }

  void _dfs(String digits, int idx, List<String> map, String cur, List<String> res) {
    if (idx == digits.length) {
      res.add(cur);
      return;
    }
    final letters = map[int.parse(digits[idx])];
    for (var i = 0; i < letters.length; i++) {
      _dfs(digits, idx + 1, map, cur + letters[i], res);
    }
  }
}
