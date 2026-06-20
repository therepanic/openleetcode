public class Solution {
    public int LongestPalindrome(string s) {
        Dictionary<char, int> count = new Dictionary<char, int>();
        foreach (char c in s) {
            if (count.ContainsKey(c)) {
                count[c]++;
            } else {
                count[c] = 1;
            }
        }
        
        int maxLen = 0;
        bool odd = false;
        
        foreach (int freq in count.Values) {
            if (freq % 2 == 0) {
                maxLen += freq;
            } else {
                maxLen += freq - 1;
                odd = true;
            }
        }
        
        return maxLen + (odd ? 1 : 0);
    }
}
