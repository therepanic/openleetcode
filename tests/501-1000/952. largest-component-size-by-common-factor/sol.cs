public class Solution {
    public int LargestComponentSize(int[] nums) {
        int n = nums.Length;
        int[] root = new int[n];
        int[] rank = new int[n];
        for (int i = 0; i < n; i++) {
            root[i] = i;
            rank[i] = 1;
        }

        int Find(int x) {
            while (root[x] != x) {
                root[x] = root[root[x]];
                x = root[x];
            }
            return x;
        }

        void Union(int x, int y) {
            int rx = Find(x);
            int ry = Find(y);
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

        List<int> GetPrimeFactors(int num) {
            List<int> res = new List<int>();
            int n = num;
            if (n % 2 == 0) {
                res.Add(2);
                while (n % 2 == 0) n /= 2;
            }
            for (int i = 3; i * i <= n; i += 2) {
                if (n % i == 0) {
                    res.Add(i);
                    while (n % i == 0) n /= i;
                }
            }
            if (n > 2) res.Add(n);
            return res;
        }

        Dictionary<int, int> primeToIdx = new Dictionary<int, int>();
        for (int i = 0; i < n; i++) {
            List<int> primes = GetPrimeFactors(nums[i]);
            foreach (int p in primes) {
                if (primeToIdx.ContainsKey(p)) {
                    Union(primeToIdx[p], i);
                }
                primeToIdx[p] = i;
            }
        }

        Dictionary<int, int> count = new Dictionary<int, int>();
        int maxSize = 0;
        for (int i = 0; i < n; i++) {
            int r = Find(i);
            if (!count.ContainsKey(r)) count[r] = 0;
            count[r]++;
            if (count[r] > maxSize) maxSize = count[r];
        }
        return maxSize;
    }
}
