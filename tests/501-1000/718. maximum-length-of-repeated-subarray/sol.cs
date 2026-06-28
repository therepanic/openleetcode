public class Solution {
    public int FindLength(int[] nums1, int[] nums2) {
        const long P = 113;
        const long MOD = 1_000_000_007;
        long Pinv = ModPow(P, MOD - 2, MOD);

        bool Check(int guess) {
            if (guess == 0) return true;

            var hashes = new Dictionary<long, List<int>>();

            // nums1
            long h = 0;
            long power = 1;
            for (int i = 0; i < nums1.Length; i++) {
                h = (h + nums1[i] * power) % MOD;
                if (i < guess - 1) {
                    power = (power * P) % MOD;
                } else {
                    int start = i - (guess - 1);
                    if (!hashes.ContainsKey(h)) hashes[h] = new List<int>();
                    hashes[h].Add(start);
                    h = (h - nums1[start] + MOD) * Pinv % MOD;
                }
            }

            // nums2
            h = 0;
            power = 1;
            for (int i = 0; i < nums2.Length; i++) {
                h = (h + nums2[i] * power) % MOD;
                if (i < guess - 1) {
                    power = (power * P) % MOD;
                } else {
                    int start = i - (guess - 1);
                    if (hashes.TryGetValue(h, out var indices)) {
                        foreach (int idx in indices) {
                            if (ArrayEqual(nums1, idx, nums2, start, guess)) {
                                return true;
                            }
                        }
                    }
                    h = (h - nums2[start] + MOD) * Pinv % MOD;
                }
            }
            return false;
        }

        int lo = 0;
        int hi = Math.Min(nums1.Length, nums2.Length) + 1;
        while (lo < hi) {
            int mi = (lo + hi) / 2;
            if (Check(mi)) {
                lo = mi + 1;
            } else {
                hi = mi;
            }
        }
        return lo - 1;
    }

    private bool ArrayEqual(int[] a, int i, int[] b, int j, int len) {
        for (int k = 0; k < len; k++) {
            if (a[i + k] != b[j + k]) return false;
        }
        return true;
    }

    private long ModPow(long baseNum, long exp, long mod) {
        long result = 1;
        baseNum %= mod;
        while (exp > 0) {
            if ((exp & 1) == 1) result = (result * baseNum) % mod;
            baseNum = (baseNum * baseNum) % mod;
            exp >>= 1;
        }
        return result;
    }
}
