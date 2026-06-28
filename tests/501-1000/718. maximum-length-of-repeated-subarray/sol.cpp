class Solution {
public:
    int findLength(vector<int>& nums1, vector<int>& nums2) {
        const long long P = 113;
        const long long MOD = 1'000'000'007;
        long long Pinv = modPow(P, MOD - 2, MOD);

        auto check = [&](int guess) -> bool {
            if (guess == 0) return true;

            unordered_map<long long, vector<int>> hashes;

            // nums1
            long long h = 0;
            long long power = 1;
            for (int i = 0; i < nums1.size(); ++i) {
                h = (h + nums1[i] * power) % MOD;
                if (i < guess - 1) {
                    power = (power * P) % MOD;
                } else {
                    int start = i - (guess - 1);
                    hashes[h].push_back(start);
                    h = (h - nums1[start] + MOD) * Pinv % MOD;
                }
            }

            // nums2
            h = 0;
            power = 1;
            for (int i = 0; i < nums2.size(); ++i) {
                h = (h + nums2[i] * power) % MOD;
                if (i < guess - 1) {
                    power = (power * P) % MOD;
                } else {
                    int start = i - (guess - 1);
                    if (hashes.count(h)) {
                        for (int idx : hashes[h]) {
                            if (equal(nums1.begin() + idx, nums1.begin() + idx + guess,
                                      nums2.begin() + start)) {
                                return true;
                            }
                        }
                    }
                    h = (h - nums2[start] + MOD) * Pinv % MOD;
                }
            }
            return false;
        };

        int lo = 0;
        int hi = min(nums1.size(), nums2.size()) + 1;
        while (lo < hi) {
            int mi = (lo + hi) / 2;
            if (check(mi)) {
                lo = mi + 1;
            } else {
                hi = mi;
            }
        }
        return lo - 1;
    }

private:
    long long modPow(long long base, long long exp, long long mod) {
        long long result = 1;
        base %= mod;
        while (exp > 0) {
            if (exp & 1) result = (result * base) % mod;
            base = (base * base) % mod;
            exp >>= 1;
        }
        return result;
    }
};
