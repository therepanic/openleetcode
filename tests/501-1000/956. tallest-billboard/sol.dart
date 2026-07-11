class Solution {
  int tallestBillboard(List<int> rods) {
    int n = rods.length;
    int mid = (n - 1) >> 1;
    
    List<List<int>> left = [];
    List<List<int>> right = [];
    
    void gen(int idx, int end, int a, int b, List<List<int>> vals) {
      if (idx == end + 1) {
        vals.add([a - b, b]);
        return;
      }
      gen(idx + 1, end, a, b, vals);
      gen(idx + 1, end, a + rods[idx], b, vals);
      gen(idx + 1, end, a, b + rods[idx], vals);
    }
    
    gen(0, mid, 0, 0, left);
    gen(mid + 1, n - 1, 0, 0, right);
    
    left.sort((a, b) => a[0] != b[0] ? a[0].compareTo(b[0]) : b[1].compareTo(a[1]));
    right.sort((a, b) => a[0] != b[0] ? a[0].compareTo(b[0]) : b[1].compareTo(a[1]));
    
    int ans = 0;
    List<int> rightDiffs = right.map((e) => e[0]).toList();
    List<int> rightHeights = right.map((e) => e[1]).toList();
    
    for (var l in left) {
      int d = l[0], b = l[1];
      int target = -d;
      int idx = lowerBound(rightDiffs, target);
      if (idx < rightDiffs.length && rightDiffs[idx] == target) {
        ans = max(ans, b + rightHeights[idx]);
      }
    }
    return ans;
  }
  
  int lowerBound(List<int> arr, int target) {
    int lo = 0, hi = arr.length;
    while (lo < hi) {
      int mid = (lo + hi) >> 1;
      if (arr[mid] < target) lo = mid + 1;
      else hi = mid;
    }
    return lo;
  }
  
  int max(int a, int b) => a > b ? a : b;
}
