public class Solution {
    public int MaxScoreSightseeingPair(int[] values) {
        int n = values.Length;
        int[] suffixMax = new int[n];
        suffixMax[n - 1] = values[n - 1] - (n - 1);
        
        for (int i = n - 2; i >= 0; i--) {
            suffixMax[i] = Math.Max(suffixMax[i + 1], values[i] - i);
        }
        
        int maxScore = int.MinValue;
        for (int i = 0; i < n - 1; i++) {
            maxScore = Math.Max(maxScore, values[i] + i + suffixMax[i + 1]);
        }
        
        return maxScore;
    }
}
