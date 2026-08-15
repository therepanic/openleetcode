public class Solution {
    public bool HalvesAreAlike(string s) {
        string vowels = "aeiouAEIOU";
        int mid = s.Length / 2;
        int count = 0;
        for (int i = 0; i < mid; i++) {
            if (vowels.IndexOf(s[i]) != -1) count++;
        }
        for (int i = mid; i < s.Length; i++) {
            if (vowels.IndexOf(s[i]) != -1) count--;
        }
        return count == 0;
    }
}
