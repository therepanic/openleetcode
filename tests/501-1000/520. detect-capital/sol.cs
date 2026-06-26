public class Solution {
    public bool DetectCapitalUse(string word) {
        return word == word.ToUpper() || 
               word == word.ToLower() || 
               word == char.ToUpper(word[0]) + word.Substring(1).ToLower();
    }
}
