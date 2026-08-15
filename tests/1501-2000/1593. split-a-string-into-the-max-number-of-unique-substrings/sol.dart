class Solution {
  int maxUniqueSplit(String s) {
    Set<String> used = {};
    int ans = 0;
    
    void backtrack(int index) {
      if (index == s.length) {
        if (used.length > ans) {
          ans = used.length;
        }
        return;
      }
      for (int j = index; j < s.length; j++) {
        String curr = s.substring(index, j + 1);
        if (used.contains(curr)) continue;
        used.add(curr);
        backtrack(j + 1);
        used.remove(curr);
      }
    }
    
    backtrack(0);
    return ans;
  }
}
