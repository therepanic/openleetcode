public class Solution {
    public int CharacterReplacement(string s, int k) {
        int maxCount = 0;
        int left = 0;
        int[] freq = new int[26];
        
        for (int right = 0; right < s.Length; right++) {
            freq[s[right] - 'A']++;
            maxCount = Math.Max(maxCount, freq[s[right] - 'A']);
            
            if (right - left + 1 - maxCount > k) {
                freq[s[left] - 'A']--;
                left++;
            }
        }
        
        return s.Length - left;
    }
}
