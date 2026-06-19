class Solution {
  int findContentChildren(List<int> g, List<int> s) {
    g.sort();
    s.sort();
    int i = 0, j = 0, count = 0;
    while (i < g.length && j < s.length) {
      if (s[j] >= g[i]) {
        count++;
        i++;
      }
      j++;
    }
    return count;
  }
}
