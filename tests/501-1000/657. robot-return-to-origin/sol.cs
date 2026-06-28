public class Solution {
    public bool JudgeCircle(string moves) {
        int countL = 0, countR = 0, countU = 0, countD = 0;
        foreach (char c in moves) {
            if (c == 'L') countL++;
            else if (c == 'R') countR++;
            else if (c == 'U') countU++;
            else if (c == 'D') countD++;
        }
        return countL == countR && countU == countD;
    }
}
