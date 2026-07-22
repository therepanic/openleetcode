class Solution {
  List<int> arrayRankTransform(List<int> arr) {
    List<int> s = List.from(arr)..sort();
    List<int> unique = [];
    for (int x in s) {
      if (unique.isEmpty || unique.last != x) {
        unique.add(x);
      }
    }
    for (int i = 0; i < arr.length; i++) {
      arr[i] = bisectLeft(unique, arr[i]) + 1;
    }
    return arr;
  }
  
  int bisectLeft(List<int> a, int x) {
    int lo = 0, hi = a.length;
    while (lo < hi) {
      int mid = (lo + hi) ~/ 2;
      if (a[mid] < x) {
        lo = mid + 1;
      } else {
        hi = mid;
      }
    }
    return lo;
  }
}
