public class Solution {
    public string ReorganizeString(string s) {
        int[] counts = new int[26];
        foreach (char ch in s) {
            counts[ch - 'a']++;
        }

        int maxIndex = 0;
        for (int i = 1; i < 26; i++) {
            if (counts[i] > counts[maxIndex]) {
                maxIndex = i;
            }
        }

        if (counts[maxIndex] > (s.Length + 1) / 2) {
            return "";
        }

        char[] result = new char[s.Length];
        int pos = 0;

        while (counts[maxIndex] > 0) {
            result[pos] = (char)('a' + maxIndex);
            pos += 2;
            counts[maxIndex]--;
        }

        for (int i = 0; i < 26; i++) {
            while (counts[i] > 0) {
                if (pos >= s.Length) {
                    pos = 1;
                }
                result[pos] = (char)('a' + i);
                pos += 2;
                counts[i]--;
            }
        }

        return new string(result);
    }
}
