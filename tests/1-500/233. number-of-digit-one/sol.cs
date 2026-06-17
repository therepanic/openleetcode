public class Solution {
    public int CountDigitOne(int n) {
        int count = 0;
        long factor = 1;
        while (factor <= n) {
            long lower = n % factor;
            long cur = (n / factor) % 10;
            long higher = n / (factor * 10);
            if (cur == 0) {
                count += (int)(higher * factor);
            } else if (cur == 1) {
                count += (int)(higher * factor + lower + 1);
            } else {
                count += (int)((higher + 1) * factor);
            }
            factor *= 10;
        }
        return count;
    }
}
