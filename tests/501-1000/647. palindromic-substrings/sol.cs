public class Solution {
    public int CountSubstrings(string s) {
        int count = 0;
        
        int Expand(int left, int right) {
            int res = 0;
            while (left >= 0 && right < s.Length && s[left] == s[right]) {
                res++;
                left--;
                right++;
            }
            return res;
        }
        
        for (int i = 0; i < s.Length; i++) {
            count += Expand(i, i);
            count += Expand(i, i + 1);
        }
        
        return count;
    }
}
