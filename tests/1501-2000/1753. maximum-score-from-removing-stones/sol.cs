public class Solution {
    public int MaximumScore(int a, int b, int c) {
        int sum = a + b + c;
        return Math.Min(sum - Math.Max(a, Math.Max(b, c)), sum / 2);
    }
}
