class Solution {
  int countPrimeSetBits(int left, int right) {
    int count = 0;
    for (int i = left; i <= right; i++) {
      int setBits = i.toRadixString(2).split('').where((c) => c == '1').length;
      if (isPrime(setBits)) {
        count++;
      }
    }
    return count;
  }
  
  bool isPrime(int n) {
    if (n <= 1) return false;
    for (int i = 2; i * i <= n; i++) {
      if (n % i == 0) return false;
    }
    return true;
  }
}
