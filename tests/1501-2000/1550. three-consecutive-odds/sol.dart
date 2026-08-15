class Solution {
  bool threeConsecutiveOdds(List<int> arr) {
    String s = arr.map((x) => (x & 1).toString()).join();
    return s.contains('111');
  }
}
