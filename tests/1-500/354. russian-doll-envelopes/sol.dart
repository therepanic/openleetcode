class Solution {
  int maxEnvelopes(List<List<int>> envelopes) {
    envelopes.sort((a, b) => a[0] == b[0] ? b[1].compareTo(a[1]) : a[0].compareTo(b[0]));
    List<int> result = [];
    for (var e in envelopes) {
      int h = e[1];
      int idx = _binarySearchLeft(result, h);
      if (idx == result.length) {
        result.add(h);
      } else {
        result[idx] = h;
      }
    }
    return result.length;
  }
  
  int _binarySearchLeft(List<int> list, int target) {
    int lo = 0, hi = list.length;
    while (lo < hi) {
      int mid = lo + (hi - lo) ~/ 2;
      if (list[mid] < target) {
        lo = mid + 1;
      } else {
        hi = mid;
      }
    }
    return lo;
  }
}
