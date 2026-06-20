class Solution {
public:
    int hammingWeight(long long n) {
        unsigned int value = static_cast<unsigned int>(n);
        int ans = 0;
        for (int i = 0; i < 32; i++) {
            ans += static_cast<int>((value >> i) & 1U);
        }
        return ans;
    }
};
