class Solution {
    public int characterReplacement(String s, int k) {
        int maxCount = 0;
        int left = 0;
        int[] freq = new int[26];
        
        for (int right = 0; right < s.length(); right++) {
            freq[s.charAt(right) - 'A']++;
            maxCount = Math.max(maxCount, freq[s.charAt(right) - 'A']);
            
            if (right - left + 1 - maxCount > k) {
                freq[s.charAt(left) - 'A']--;
                left++;
            }
        }
        
        return s.length() - left;
    }
}
