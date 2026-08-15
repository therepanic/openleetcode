public class Solution {
    public bool MakeEqual(string[] words) {
        int[] freq = new int[26];
        int n = words.Length;
        foreach (string word in words) {
            foreach (char ch in word) {
                freq[ch - 'a']++;
            }
        }
        foreach (int count in freq) {
            if (count % n != 0) {
                return false;
            }
        }
        return true;
    }
}
