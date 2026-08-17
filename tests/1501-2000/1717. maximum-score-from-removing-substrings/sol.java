class Solution {
    public int maximumGain(String s, int x, int y) {
        int score = 0;
        char ch1 = 'a', ch2 = 'b';
        int cnt1 = 0, cnt2 = 0;

        if (x < y) {
            int temp = x;
            x = y;
            y = temp;
            ch1 = 'b';
            ch2 = 'a';
        }

        for (char ch : s.toCharArray()) {
            if (ch == ch1) {
                cnt1++;
            } else if (ch == ch2) {
                if (cnt1 > 0) {
                    cnt1--;
                    score += x;
                } else {
                    cnt2++;
                }
            } else {
                score += Math.min(cnt1, cnt2) * y;
                cnt1 = 0;
                cnt2 = 0;
            }
        }

        if (cnt1 != 0) {
            score += Math.min(cnt1, cnt2) * y;
        }

        return score;
    }
}
