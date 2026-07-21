class Solution {
public:
    int maxScore(string s) {
        int totalOnes = 0;
        for (char c : s) {
            if (c == '1') totalOnes++;
        }
        
        int zerosCount = 0;
        int onesCount = 0;
        int bestScore = INT_MIN;
        
        for (int i = 0; i < s.length() - 1; i++) {
            if (s[i] == '0') {
                zerosCount++;
            } else {
                onesCount++;
            }
            
            int currentScore = zerosCount + (totalOnes - onesCount);
            bestScore = max(bestScore, currentScore);
        }
        
        return bestScore;
    }
};
