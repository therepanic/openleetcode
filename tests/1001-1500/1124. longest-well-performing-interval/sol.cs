public class Solution {
    public int LongestWPI(int[] hours) {
        int score = 0;
        int longestInterval = 0;
        var seenAt = new Dictionary<int, int>();
        seenAt[0] = -1;
        
        for (int i = 0; i < hours.Length; i++) {
            score += hours[i] > 8 ? 1 : -1;
            
            if (score > 0) {
                longestInterval = i + 1;
            } else if (seenAt.ContainsKey(score - 1)) {
                longestInterval = Math.Max(longestInterval, i - seenAt[score - 1]);
            }
            
            if (!seenAt.ContainsKey(score)) {
                seenAt[score] = i;
            }
        }
        
        return longestInterval;
    }
}
