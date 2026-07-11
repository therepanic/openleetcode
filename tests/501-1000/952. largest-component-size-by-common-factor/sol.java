import java.util.*;

class Solution {
    public int largestComponentSize(int[] nums) {
        int n = nums.length;
        int[] root = new int[n];
        int[] rank = new int[n];
        for (int i = 0; i < n; i++) {
            root[i] = i;
            rank[i] = 1;
        }

        Map<Integer, Integer> primeToIdx = new HashMap<>();

        for (int i = 0; i < n; i++) {
            List<Integer> primes = getPrimeFactors(nums[i]);
            for (int p : primes) {
                if (primeToIdx.containsKey(p)) {
                    union(root, rank, primeToIdx.get(p), i);
                }
                primeToIdx.put(p, i);
            }
        }

        Map<Integer, Integer> count = new HashMap<>();
        int max = 0;
        for (int i = 0; i < n; i++) {
            int r = find(root, i);
            int c = count.getOrDefault(r, 0) + 1;
            count.put(r, c);
            if (c > max) max = c;
        }
        return max;
    }

    private List<Integer> getPrimeFactors(int n) {
        List<Integer> factors = new ArrayList<>();
        if (n % 2 == 0) {
            factors.add(2);
            while (n % 2 == 0) n /= 2;
        }
        for (int i = 3; i * i <= n; i += 2) {
            if (n % i == 0) {
                factors.add(i);
                while (n % i == 0) n /= i;
            }
        }
        if (n > 2) factors.add(n);
        return factors;
    }

    private int find(int[] root, int x) {
        while (root[x] != x) {
            root[x] = root[root[x]];
            x = root[x];
        }
        return x;
    }

    private void union(int[] root, int[] rank, int x, int y) {
        int rx = find(root, x);
        int ry = find(root, y);
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
}
