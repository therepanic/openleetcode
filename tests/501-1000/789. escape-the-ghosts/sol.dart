class Solution {
  bool escapeGhosts(List<List<int>> ghosts, List<int> target) {
    List<int> a = [];
    for (var i in ghosts) {
      a.add((i[0] - target[0]).abs() + (i[1] - target[1]).abs());
    }
    
    int z = (target[0] - 0).abs() + (target[1] - 0).abs();
    
    bool ans = true;
    for (var i in a) {
      if (i <= z) {
        ans = false;
      }
    }
    
    return ans;
  }
}
