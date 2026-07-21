class Solution {
  bool canArrange(List<int> arr, int k) {
    List<int> a = arr.map((v) => ((v % k) + k) % k).toList()..sort();
    int j = a.where((v) => v == 0).length;
    if (j % 2 != 0) return false;
    List<int> b = a.sublist(j);
    for (int l = 0, r = b.length - 1; l < r; l++, r--) {
      if ((b[l] + b[r]) % k != 0) return false;
    }
    return true;
  }
}
