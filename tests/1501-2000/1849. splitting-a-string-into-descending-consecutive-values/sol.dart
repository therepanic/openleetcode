class Solution {
  bool splitString(String s) {
    bool dfs(int index, int prev, int count) {
      if (index == s.length) {
        return count >= 2;
      }
      
      int curr = 0;
      for (int i = index; i < s.length; i++) {
        curr = curr * 10 + (s.codeUnitAt(i) - 48);
        if (prev == -1 || prev - curr == 1) {
          if (dfs(i + 1, curr, count + 1)) {
            return true;
          }
        } else if (curr >= prev && prev != -1) {
          break;
        }
      }
      return false;
    }
    
    return dfs(0, -1, 0);
  }
}
