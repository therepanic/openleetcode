class Solution {
    public boolean judgeCircle(String moves) {
        int countL = 0, countR = 0, countU = 0, countD = 0;
        for (char c : moves.toCharArray()) {
            if (c == 'L') countL++;
            else if (c == 'R') countR++;
            else if (c == 'U') countU++;
            else if (c == 'D') countD++;
        }
        return countL == countR && countU == countD;
    }
}
