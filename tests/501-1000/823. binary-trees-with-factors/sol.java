import java.util.*;

class Solution {
    public int numFactoredBinaryTrees(int[] arr) {
        int MOD = 1_000_000_007;
        Arrays.sort(arr);
        Map<Integer, Long> dp = new HashMap<>();
        Set<Integer> s = new HashSet<>();
        for (int v : arr) s.add(v);
        for (int x : arr) {
            dp.put(x, 1L);
            for (int a : arr) {
                if (a > x) break;
                if (x % a == 0) {
                    int b = x / a;
                    if (s.contains(b)) {
                        dp.put(x, (dp.get(x) + dp.get(a) * dp.get(b)) % MOD);
                    }
                }
            }
        }
        long sum = 0;
        for (long v : dp.values()) sum = (sum + v) % MOD;
        return (int) sum;
    }
}
