public class Solution {
    public int IntegerReplacement(int n) {
        int Helper(long x, int c) {
            if (x == 1) return c;
            if (x % 2 == 0) {
                return Helper(x >> 1, c + 1);
            } else {
                if (x == 3 || ((x >> 1) & 1) == 0) {
                    return Helper(x - 1, c + 1);
                } else {
                    return Helper(x + 1, c + 1);
                }
            }
        }
        return Helper((long)n, 0);
    }
}
