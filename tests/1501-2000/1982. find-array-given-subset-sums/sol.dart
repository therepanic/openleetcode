class Solution {
  List<int> recoverArray(int n, List<int> sums) {
    sums.sort();
    List<int> res = [];
    
    for (int i = 0; i < n; i++) {
      int d = sums[1] - sums[0];
      
      List<int> left = [];
      List<int> right = [];
      Map<int, int> count = {};
      for (int s in sums) {
        count[s] = (count[s] ?? 0) + 1;
      }
      
      for (int s in sums) {
        if (count[s]! > 0) {
          left.add(s);
          right.add(s + d);
          count[s] = count[s]! - 1;
          count[s + d] = (count[s + d] ?? 0) - 1;
        }
      }
      
      bool hasZero = left.contains(0);
      if (hasZero) {
        res.add(d);
        sums = left;
      } else {
        res.add(-d);
        sums = right;
      }
    }
    return res;
  }
}
