public class Solution {
    public int BitwiseComplement(int n) {
        if (n == 0) {
            return 1;
        }
        int bitLength = 0;
        int value = n;
        while (value > 0) {
            bitLength++;
            value >>= 1;
        }
        int mask = (1 << bitLength) - 1;
        return n ^ mask;
    }
}
