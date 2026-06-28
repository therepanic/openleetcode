public class Solution {
    public int RepeatedStringMatch(string a, string b) {
        string repeatA = a;
        int count = 1;

        while (repeatA.Length < b.Length) {
            repeatA += a;
            count++;
            if (repeatA.Contains(b)) {
                return count;
            }
        }

        repeatA += a;
        count++;
        if (repeatA.Contains(b)) {
            return count;
        }

        return -1;
    }
}
