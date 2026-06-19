public class Solution {
    public int FindKthNumber(int n, int k) {
        long current = 1;
        k--;
        while (k > 0) {
            long steps = CountSteps(n, current, current + 1);
            if (steps <= k) {
                current++;
                k -= (int)steps;
            } else {
                current *= 10;
                k--;
            }
        }
        return (int)current;
    }

    private long CountSteps(int n, long prefix, long nextPrefix) {
        long steps = 0;
        long limit = (long)n + 1;
        while (prefix < limit) {
            steps += Math.Min(limit, nextPrefix) - prefix;
            prefix *= 10;
            nextPrefix *= 10;
        }
        return steps;
    }
}
