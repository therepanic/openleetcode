class Solution {
    public int getSum(int a, int b) {
        a &= 0xffffffff;
        b &= 0xffffffff;
        while (b != 0) {
            int c = (a & b) << 1;
            a = (a ^ b) & 0xffffffff;
            b = c & 0xffffffff;
        }
        return a < 0x80000000 ? a : ~(a ^ 0xffffffff);
    }
}
