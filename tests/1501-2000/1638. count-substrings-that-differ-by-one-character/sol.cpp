class Solution {
public:
    int countSubstrings(string s, string t) {
        int m = s.length(), n = t.length();
        int result = 0;

        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                int diff = 0;
                int k = 0;
                while (i + k < m && j + k < n) {
                    if (s[i + k] != t[j + k]) {
                        diff++;
                    }
                    if (diff > 1) {
                        break;
                    }
                    if (diff == 1) {
                        result++;
                    }
                    k++;
                }
            }
        }

        return result;
    }
};
