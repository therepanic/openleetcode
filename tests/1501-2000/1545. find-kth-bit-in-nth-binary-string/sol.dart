class Solution {
  String findKthBit(int n, int k) {
    if (n == 1) {
      return '0';
    }
    
    int length = (1 << n) - 1;
    int mid = (length + 1) ~/ 2;
    
    if (k == mid) {
      return '1';
    }
    if (k < mid) {
      return findKthBit(n - 1, k);
    }
    
    String c = findKthBit(n - 1, length - k + 1);
    return c == '0' ? '1' : '0';
  }
}
