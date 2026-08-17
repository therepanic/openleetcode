public class Solution {
    public bool SumGame(string num) {
        int n = num.Length;
        int half = n / 2;
        int sumLeft = 0, sumRight = 0;
        int qLeft = 0, qRight = 0;

        for (int i = 0; i < half; i++) {
            if (num[i] == '?') qLeft++;
            else sumLeft += num[i] - '0';
        }

        for (int i = half; i < n; i++) {
            if (num[i] == '?') qRight++;
            else sumRight += num[i] - '0';
        }

        return (sumLeft - sumRight) * 2 != (qRight - qLeft) * 9;
    }
}
