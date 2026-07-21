class Solution {
  List<String> stringMatching(List<String> words) {
    int n = words.length;
    List<String> ans = [];
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        if (i != j && words[j].contains(words[i])) {
          ans.add(words[i]);
          break;
        }
      }
    }
    return ans;
  }
}
