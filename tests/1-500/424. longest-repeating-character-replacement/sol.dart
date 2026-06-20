class Solution {
  int characterReplacement(String s, int k) {
    int maxCount = 0;
    int left = 0;
    Map<String, int> freq = {};
    
    for (int right = 0; right < s.length; right++) {
      String ch = s[right];
      freq[ch] = (freq[ch] ?? 0) + 1;
      if (freq[ch]! > maxCount) {
        maxCount = freq[ch]!;
      }
      
      if (right - left + 1 - maxCount > k) {
        freq[s[left]] = freq[s[left]]! - 1;
        left++;
      }
    }
    
    return s.length - left;
  }
}
