class Solution {
  bool increasingTriplet(List<int> nums) {
    int a = double.maxFinite.toInt();
    int b = double.maxFinite.toInt();
    bool f = false;
    for (int x in nums) {
      if (x <= a) {
        a = x;
      } else if (x <= b) {
        b = x;
      } else {
        f = true;
      }
    }
    return f;
  }
}
