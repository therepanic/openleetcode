class Solution {
  int preimageSizeFZF(int k) {
    int trailingZeroes(int n) {
      int count = 0;
      int power = 5;
      while (power <= n) {
        count += n ~/ power;
        power *= 5;
      }
      return count;
    }
    
    int start = k * 4;
    while (true) {
      int H = trailingZeroes(start);
      if (H == k) {
        return 5;
      }
      if (H > k) {
        break;
      }
      start++;
    }
    return 0;
  }
}
