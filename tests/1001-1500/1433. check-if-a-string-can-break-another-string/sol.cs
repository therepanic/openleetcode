public class Solution {
    public bool CheckIfCanBreak(string s1, string s2) {
        int[] freq = new int[26];
        int n = s1.Length;

        foreach (char ch in s1) {
            freq[ch - 'a']++;
        }

        System.Text.StringBuilder temp1 = new System.Text.StringBuilder();

        for (int i = 25; i >= 0; i--) {
            while (freq[i] > 0) {
                temp1.Append((char)('a' + i));
                freq[i]--;
            }
        }

        freq = new int[26];

        foreach (char ch in s2) {
            freq[ch - 'a']++;
        }

        System.Text.StringBuilder temp2 = new System.Text.StringBuilder();

        for (int i = 25; i >= 0; i--) {
            while (freq[i] > 0) {
                temp2.Append((char)('a' + i));
                freq[i]--;
            }
        }

        string sorted1 = temp1.ToString();
        string sorted2 = temp2.ToString();

        bool all1 = true;
        bool all2 = true;

        for (int i = 0; i < n; i++) {
            if (sorted1[i] < sorted2[i]) {
                all1 = false;
            }
            if (sorted2[i] < sorted1[i]) {
                all2 = false;
            }
        }

        return all1 || all2;
    }
}
