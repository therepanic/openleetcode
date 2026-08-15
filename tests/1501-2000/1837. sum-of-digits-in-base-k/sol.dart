class Solution {
  int sumBase(int n, int k) {
    int total = 0;
    while (n > 0) {
      total += n % k;
      n ~/= k;
    }
    return total;
  }
}
