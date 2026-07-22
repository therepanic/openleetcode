class Solution {
  int findMinFibonacciNumbers(int k) {
    List<int> fib = [1, 1];
    while (fib.last <= k) {
      fib.add(fib[fib.length - 1] + fib[fib.length - 2]);
    }
    
    int count = 0;
    int i = fib.length - 1;
    
    while (k > 0) {
      if (fib[i] <= k) {
        k -= fib[i];
        count++;
      }
      i--;
    }
    
    return count;
  }
}
