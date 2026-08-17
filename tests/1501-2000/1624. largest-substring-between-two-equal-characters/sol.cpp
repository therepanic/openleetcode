class Solution {
public:
    int maxLengthBetweenEqualCharacters(string s) {
        vector<int> firstPos(26, -1);
        vector<int> lastPos(26, -1);
        int n = s.size();
        for (int i = 0; i < n; i++) {
            int idx = s[i] - 'a';
            if (firstPos[idx] == -1) firstPos[idx] = i;
        }
        for (int i = n - 1; i >= 0; i--) {
            int idx = s[i] - 'a';
            if (lastPos[idx] == -1) lastPos[idx] = i;
        }
        int maxLen = -1;
        for (int i = 0; i < 26; i++) {
            if (firstPos[i] != -1 && lastPos[i] != -1) {
                maxLen = max(maxLen, lastPos[i] - firstPos[i] - 1);
            }
        }
        return maxLen;
    }
};
