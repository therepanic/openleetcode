class Solution {
  List<String> letterCasePermutation(String s) {
    List<String> ans = [];
    void solve(int idx, String curr) {
      if (idx == s.length) {
        ans.add(curr);
        return;
      }
      if (RegExp(r'\d').hasMatch(s[idx])) {
        solve(idx + 1, curr + s[idx]);
        return;
      }
      solve(idx + 1, curr + s[idx].toLowerCase());
      solve(idx + 1, curr + s[idx].toUpperCase());
    }
    solve(0, "");
    return ans;
  }
}
