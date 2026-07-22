class Solution {
    public int maxScore(String s) {
        int totalOnes = 0;
        for (char c : s.toCharArray()) {
            if (c == '1') totalOnes++;
        }
        
        int zerosCount = 0;
        int onesCount = 0;
        int bestScore = Integer.MIN_VALUE;
        
        for (int i = 0; i < s.length() - 1; i++) {
            if (s.charAt(i) == '0') {
                zerosCount++;
            } else {
                onesCount++;
            }
            
            int currentScore = zerosCount + (totalOnes - onesCount);
            bestScore = Math.max(bestScore, currentScore);
        }
        
        return bestScore;
    }
}
