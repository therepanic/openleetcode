public class Solution {
    public int MaxScore(string s) {
        int totalOnes = 0;
        foreach (char c in s) {
            if (c == '1') totalOnes++;
        }
        
        int zerosCount = 0;
        int onesCount = 0;
        int bestScore = int.MinValue;
        
        for (int i = 0; i < s.Length - 1; i++) {
            if (s[i] == '0') {
                zerosCount++;
            } else {
                onesCount++;
            }
            
            int currentScore = zerosCount + (totalOnes - onesCount);
            bestScore = Math.Max(bestScore, currentScore);
        }
        
        return bestScore;
    }
}
