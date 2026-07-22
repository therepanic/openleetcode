class Solution {
  bool isVowel(String c) {
    return c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u';
  }
  
  int maxVowels(String s, int k) {
    int maxVowel = 0;
    int left = 0;
    int vowel = 0;
    
    for (int right = 0; right < s.length; right++) {
      if (isVowel(s[right])) {
        vowel++;
      }
      
      if ((right - left + 1) == k) {
        if (vowel > maxVowel) {
          maxVowel = vowel;
        }
        if (isVowel(s[left])) {
          vowel--;
        }
        left++;
      }
    }
    
    return maxVowel;
  }
}
