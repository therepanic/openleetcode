class _DSU {
  final List<int> p = [], size = [];
  _DSU(int n) { for (int i = 0; i < n; i++) { p.add(i); size.add(1); } }
  int find(int x) { while (p[x] != x) { p[x] = p[p[x]]; x = p[x]; } return x; }
  void union(int a, int b) { a = find(a); b = find(b); if (a == b) return; if (size[a] < size[b]) { final t = a; a = b; b = t; } p[b] = a; size[a] += size[b]; }
}
class Solution {
  bool gcdSort(List<int> nums) {
    int mx = 0; for (final x in nums) { if (x > mx) mx = x; }
    final d = _DSU(mx + 1);
    for (final value in nums) {
      int x = value;
      for (int f = 2; f * f <= x; f++) if (x % f == 0) {
        d.union(f, value); while (x % f == 0) x ~/= f;
      }
      if (x > 1) d.union(x, value);
    }
    final sorted = List<int>.from(nums)..sort();
    for (int i = 0; i < nums.length; i++) if (d.find(nums[i]) != d.find(sorted[i])) return false;
    return true;
  }
}
