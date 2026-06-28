public class Solution {
    public bool CheckRecord(string s) {
        int aCount = 0;
        int lStreak = 0;
        
        foreach (char c in s) {
            if (c == 'A') {
                aCount++;
                if (aCount >= 2) {
                    return false;
                }
            }
            if (c == 'L') {
                lStreak++;
                if (lStreak >= 3) {
                    return false;
                }
            } else {
                lStreak = 0;
            }
        }
        
        return true;
    }
}
