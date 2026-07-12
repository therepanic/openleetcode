class Solution {
  List<bool> camelMatch(List<String> queries, String pattern) {
    List<bool> ans = [];
    for (String query in queries) {
      int j = 0;
      int i = 0;
      while (i < query.length) {
        if (query[i].toUpperCase() == query[i] && query[i] != query[i].toLowerCase() && ((j < pattern.length && query[i] != pattern[j]) || j > pattern.length - 1)) {
          break;
        }
        if (j < pattern.length && query[i] == pattern[j]) {
          j++;
        }
        i++;
      }
      if (i == query.length && j == pattern.length) {
        ans.add(true);
      } else {
        ans.add(false);
      }
    }
    return ans;
  }
}
