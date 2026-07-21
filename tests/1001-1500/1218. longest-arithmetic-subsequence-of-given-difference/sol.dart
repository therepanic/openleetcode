class Solution {
  int longestSubsequence(List<int> arr, int difference) {
    var dic = <int, int>{};
    var maxLen = 0;
    for (var x in arr) {
      if (dic.containsKey(x - difference)) {
        dic[x] = dic[x - difference]! + 1;
      } else {
        dic[x] = 1;
      }
      if (dic[x]! > maxLen) {
        maxLen = dic[x]!;
      }
    }
    return maxLen;
  }
}
