class Solution {
  int maxScore(String s) {
    int totalOnes = s.split('').where((c) => c == '1').length;
    int zerosCount = 0;
    int onesCount = 0;
    int bestScore = -9223372036854775808; // minimum int
    
    for (int i = 0; i < s.length - 1; i++) {
      if (s[i] == '0') {
        zerosCount++;
      } else {
        onesCount++;
      }
      
      int currentScore = zerosCount + (totalOnes - onesCount);
      if (currentScore > bestScore) {
        bestScore = currentScore;
      }
    }
    
    return bestScore;
  }
}
