class Solution {
  List<int> numsSameConsecDiff(int n, int k) {
    var res = <int>{};
    for (int x = 1; x <= 9; x++) {
      res.add(x);
    }
    n -= 1;
    
    while (n > 0) {
      var next = <int>{};
      for (int val in res) {
        int last = val % 10;
        if (last + k < 10) {
          next.add(val * 10 + last + k);
        }
        if (last - k >= 0) {
          next.add(val * 10 + last - k);
        }
      }
      res = next;
      n -= 1;
    }
    
    return res.toList();
  }
}
