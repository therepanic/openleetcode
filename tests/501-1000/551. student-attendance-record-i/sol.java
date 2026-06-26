class Solution {
    public boolean checkRecord(String s) {
        int aCount = 0;
        int lStreak = 0;
        
        for (char c : s.toCharArray()) {
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
