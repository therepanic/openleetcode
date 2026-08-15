class Solution {
  bool isThree(int n) {
    var count = 0;
    for (var i = 1; i <= n; i++) {
      if (n % i == 0) {
        count++;
      }
    }
    return count == 3;
  }
}
