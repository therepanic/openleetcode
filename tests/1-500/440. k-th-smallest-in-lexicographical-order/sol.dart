class Solution {
  int findKthNumber(int n, int k) {
    return solve(0, n, k);
  }

  int solve(int current, int n, int k) {
    if (k == 0) {
      return current ~/ 10;
    }

    int start = current > 1 ? current : 1;
    for (int i = start; i < current + 10; i++) {
      int count = numOfChildren(i, i + 1, n);
      if (count >= k) {
        return solve(i * 10, n, k - 1);
      }
      k -= count;
    }

    return -1;
  }

  int numOfChildren(int current, int neighbour, int n) {
    if (neighbour > n) {
      if (current > n) {
        return 0;
      }
      return n - current + 1;
    }
    return (neighbour - current) + numOfChildren(current * 10, neighbour * 10, n);
  }
}
