public class Solution {
    public int LongestBeautifulSubstring(string word) {
        int n = word.Length;
        int i = 0;
        int length = 0;

        while (i < n) {
            if (word[i] != 'a') {
                i++;
                continue;
            }

            int j = i;
            int unique = 1;
            while (j + 1 < n && word[j + 1] >= word[j]) {
                if (word[j + 1] != word[j]) {
                    unique++;
                }
                j++;
            }

            if (unique == 5) {
                length = Math.Max(length, j - i + 1);
            }

            i = j + 1;
        }

        return length;
    }
}
