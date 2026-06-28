class Solution {
    public int findLength(int[] nums1, int[] nums2) {
        final int P = 113;
        final int MOD = 1_000_000_007;
        final int Pinv = (int) modPow(P, MOD - 2, MOD);

        int lo = 0;
        int hi = Math.min(nums1.length, nums2.length) + 1;

        while (lo < hi) {
            int mi = (lo + hi) / 2;
            if (check(nums1, nums2, mi, P, MOD, Pinv)) {
                lo = mi + 1;
            } else {
                hi = mi;
            }
        }
        return lo - 1;
    }

    private boolean check(int[] nums1, int[] nums2, int guess, int P, int MOD, int Pinv) {
        if (guess == 0) return true;

        Map<Long, List<Integer>> hashes = new HashMap<>();

        // nums1
        long h = 0;
        long power = 1;
        for (int i = 0; i < nums1.length; i++) {
            h = (h + (long) nums1[i] * power) % MOD;
            if (i < guess - 1) {
                power = (power * P) % MOD;
            } else {
                int start = i - (guess - 1);
                hashes.computeIfAbsent(h, k -> new ArrayList<>()).add(start);
                h = (h - nums1[start] + MOD) * Pinv % MOD;
            }
        }

        // nums2
        h = 0;
        power = 1;
        for (int i = 0; i < nums2.length; i++) {
            h = (h + (long) nums2[i] * power) % MOD;
            if (i < guess - 1) {
                power = (power * P) % MOD;
            } else {
                int start = i - (guess - 1);
                List<Integer> list = hashes.get(h);
                if (list != null) {
                    for (int idx : list) {
                        if (arrayEquals(nums1, idx, nums2, start, guess)) {
                            return true;
                        }
                    }
                }
                h = (h - nums2[start] + MOD) * Pinv % MOD;
            }
        }
        return false;
    }

    private boolean arrayEquals(int[] a, int i, int[] b, int j, int len) {
        for (int k = 0; k < len; k++) {
            if (a[i + k] != b[j + k]) return false;
        }
        return true;
    }

    private long modPow(long base, int exp, int mod) {
        long result = 1;
        while (exp > 0) {
            if ((exp & 1) == 1) result = (result * base) % mod;
            base = (base * base) % mod;
            exp >>= 1;
        }
        return result;
    }
}
