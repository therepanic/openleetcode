class Solution {
  int countLargestGroup(int n) {
    Map<int, int> mpp = {};
    int maxi = 0;
    int count = 0;

    for (int i = 1; i <= n; i++) {
      int x = digsum(i);
      mpp[x] = (mpp[x] ?? 0) + 1;
      if (mpp[x]! > maxi) {
        maxi = mpp[x]!;
      }
    }

    for (int v in mpp.values) {
      if (v == maxi) {
        count++;
      }
    }
    return count;
  }

  int digsum(int n) {
    int s = 0;
    while (n > 0) {
      s += n % 10;
      n ~/= 10;
    }
    return s;
  }
}
