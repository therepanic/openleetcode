class Solution {
public:
    long long reverseBits(long long n) {
        unsigned int value = static_cast<unsigned int>(n);
        unsigned int ans = 0;
        for (int i = 0; i < 32; i++) {
            ans = (ans << 1) | (value & 1U);
            value >>= 1;
        }
        return static_cast<unsigned long long>(ans);
    }
};
