public class Solution {
    public int HammingWeight(long n) {
        ulong value = (ulong)n & 0xffffffffUL;
        int ans = 0;
        while (value != 0) {
            ans += (int)(value & 1UL);
            value >>= 1;
        }
        return ans;
    }
}
