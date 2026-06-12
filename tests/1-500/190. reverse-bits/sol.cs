public class Solution {
    public long ReverseBits(long n) {
        ulong value = (ulong)n & 0xffffffffUL;
        ulong ans = 0;
        for (int i = 0; i < 32; i++) {
            ans = (ans << 1) | (value & 1UL);
            value >>= 1;
        }
        return (long)ans;
    }
}
