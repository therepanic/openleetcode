class Solution {
  int getXORSum(List<int> arr1, List<int> arr2) {
    int x = 0, y = 0;
    for (int v in arr1) {
      x ^= v;
    }
    for (int v in arr2) {
      y ^= v;
    }
    return x & y;
  }
}
