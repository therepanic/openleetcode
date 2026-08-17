class Solution {
    public boolean sumGame(String num) {
        int n = num.length();
        int half = n / 2;
        int sumLeft = 0, sumRight = 0;
        int qLeft = 0, qRight = 0;

        for (int i = 0; i < half; i++) {
            char c = num.charAt(i);
            if (c == '?') qLeft++;
            else sumLeft += c - '0';
        }

        for (int i = half; i < n; i++) {
            char c = num.charAt(i);
            if (c == '?') qRight++;
            else sumRight += c - '0';
        }

        return (sumLeft - sumRight) * 2 != (qRight - qLeft) * 9;
    }
}
