public class Solution {
    public int GetSum(int a, int b) {
        a &= unchecked((int)0xffffffff);
        b &= unchecked((int)0xffffffff);
        while (b != 0) {
            int c = (a & b) << 1;
            a = (a ^ b) & unchecked((int)0xffffffff);
            b = c & unchecked((int)0xffffffff);
        }
        return a < 0x80000000 ? a : ~(a ^ unchecked((int)0xffffffff));
    }
}
