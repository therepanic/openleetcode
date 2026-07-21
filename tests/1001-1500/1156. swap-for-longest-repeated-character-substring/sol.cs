public class Solution {
    public int MaxRepOpt1(string text) {
        Dictionary<char, int> total = new Dictionary<char, int>();
        foreach (char c in text) {
            if (total.ContainsKey(c)) {
                total[c]++;
            } else {
                total[c] = 1;
            }
        }
        int n = text.Length;
        int ans = 0;
        
        foreach (var kvp in total) {
            char ch = kvp.Key;
            int chTotal = kvp.Value;
            int left = 0;
            int count = 0;
            
            for (int right = 0; right < n; right++) {
                if (text[right] == ch) {
                    count++;
                }
                
                while ((right - left + 1) - count > 1) {
                    if (text[left] == ch) {
                        count--;
                    }
                    left++;
                }
                
                ans = Math.Max(ans, Math.Min(right - left + 1, chTotal));
            }
        }
        
        return ans;
    }
}
