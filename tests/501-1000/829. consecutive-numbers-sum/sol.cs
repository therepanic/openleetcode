public class Solution {
    public int ConsecutiveNumbersSum(int n) {
        int maxSequenceLength = (int)((Math.Sqrt(1 + 8L * n) - 1) / 2);
        int c = 0;
        for (int i = 2; i <= maxSequenceLength; i++) {
            if (i % 2 == 1 && n % i == 0) {
                c++;
            } else if (i % 2 == 0 && n % i == i / 2) {
                c++;
            }
        }
        return c + 1;
    }
}
