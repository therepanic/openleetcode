class Solution {
  int largestComponentSize(List<int> nums) {
    int n = nums.length;
    List<int> root = List.generate(n, (i) => i);
    List<int> rank = List.filled(n, 1);

    int find(int x) {
      while (root[x] != x) {
        root[x] = root[root[x]];
        x = root[x];
      }
      return x;
    }

    void union(int x, int y) {
      int rx = find(x);
      int ry = find(y);
      if (rx == ry) return;
      if (rank[rx] > rank[ry]) {
        root[ry] = rx;
      } else if (rank[rx] < rank[ry]) {
        root[rx] = ry;
      } else {
        root[ry] = rx;
        rank[rx]++;
      }
    }

    List<int> getPrimeFactors(int num) {
      List<int> res = [];
      int n = num;
      if (n % 2 == 0) {
        res.add(2);
        while (n % 2 == 0) n ~/= 2;
      }
      for (int i = 3; i * i <= n; i += 2) {
        if (n % i == 0) {
          res.add(i);
          while (n % i == 0) n ~/= i;
        }
      }
      if (n > 2) res.add(n);
      return res;
    }

    Map<int, int> primeToIdx = {};
    for (int i = 0; i < n; i++) {
      List<int> primes = getPrimeFactors(nums[i]);
      for (int p in primes) {
        if (primeToIdx.containsKey(p)) {
          union(primeToIdx[p]!, i);
        }
        primeToIdx[p] = i;
      }
    }

    Map<int, int> count = {};
    int maxSize = 0;
    for (int i = 0; i < n; i++) {
      int r = find(i);
      count[r] = (count[r] ?? 0) + 1;
      if (count[r]! > maxSize) maxSize = count[r]!;
    }
    return maxSize;
  }
}
