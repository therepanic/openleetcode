class Solution {
    public int maximumScore(int a, int b, int c) {
        int sum = a + b + c;
        return Math.min(sum - Math.max(a, Math.max(b, c)), sum / 2);
    }
}
