class Solution {
public:
    int minimumSwap(string s1, string s2) {
        int n = s1.length();
        int s1_x = 0;
        int s1_y = 0;
        for (int i = 0; i < n; i++) {
            if (s1[i] == s2[i]) continue;
            if (s1[i] == 'x') {
                s1_x++;
            } else {
                s1_y++;
            }
        }

        if (s1_x % 2 != s1_y % 2) return -1;

        int swaps = s1_x / 2 + s1_y / 2;
        return s1_x % 2 == 0 ? swaps : swaps + 2;
    }
};
