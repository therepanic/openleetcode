public class Solution {
    private bool IsVowel(char c) {
        return c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u';
    }
    
    public int MaxVowels(string s, int k) {
        int maxVowel = 0;
        int left = 0;
        int vowel = 0;
        
        for (int right = 0; right < s.Length; right++) {
            if (IsVowel(s[right])) {
                vowel++;
            }
            
            if ((right - left + 1) == k) {
                maxVowel = Math.Max(maxVowel, vowel);
                if (IsVowel(s[left])) {
                    vowel--;
                }
                left++;
            }
        }
        
        return maxVowel;
    }
}
