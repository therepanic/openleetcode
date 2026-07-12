class Solution {
    public int maxScoreSightseeingPair(int[] values) {
        int n = values.length;
        int[] suffixMax = new int[n];
        suffixMax[n - 1] = values[n - 1] - (n - 1);
        
        for (int i = n - 2; i >= 0; i--) {
            suffixMax[i] = Math.max(suffixMax[i + 1], values[i] - i);
        }
        
        int maxScore = Integer.MIN_VALUE;
        for (int i = 0; i < n - 1; i++) {
            maxScore = Math.max(maxScore, values[i] + i + suffixMax[i + 1]);
        }
        
        return maxScore;
    }
}
