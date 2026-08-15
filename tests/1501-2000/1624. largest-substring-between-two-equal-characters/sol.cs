public class Solution {
    public int MaxLengthBetweenEqualCharacters(string s) {
        int[] firstPos = new int[26];
        int[] lastPos = new int[26];
        for (int i = 0; i < 26; i++) {
            firstPos[i] = -1;
            lastPos[i] = -1;
        }
        int n = s.Length;
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
                maxLen = Math.Max(maxLen, lastPos[i] - firstPos[i] - 1);
            }
        }
        return maxLen;
    }
}
