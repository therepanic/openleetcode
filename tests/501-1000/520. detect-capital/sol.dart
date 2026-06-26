class Solution {
  bool detectCapitalUse(String word) {
    return word == word.toUpperCase() || 
           word == word.toLowerCase() || 
           word == word[0].toUpperCase() + word.substring(1).toLowerCase();
  }
}
