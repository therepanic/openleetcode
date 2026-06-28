class Solution {
  List<int> partitionLabels(String s) {
    if (s.length == 1) {
      return [1];
    }
    Map<String, List<int>> seen = {};
    for (int i = 0; i < s.length; i++) {
      String ch = s[i];
      if (!seen.containsKey(ch)) {
        seen[ch] = [i, i];
      } else {
        seen[ch]![1] = i;
      }
    }
    List<List<int>> arrSeen = seen.values.toList();
    List<List<int>> merged = [arrSeen[0]];
    for (int i = 1; i < arrSeen.length; i++) {
      List<int> last = merged.last;
      List<int> cur = arrSeen[i];
      if (last[1] >= cur[0]) {
        last[1] = last[1] > cur[1] ? last[1] : cur[1];
      } else {
        merged.add(cur);
      }
    }
    List<int> ans = [];
    for (var interval in merged) {
      ans.add(interval[1] - interval[0] + 1);
    }
    return ans;
  }
}
