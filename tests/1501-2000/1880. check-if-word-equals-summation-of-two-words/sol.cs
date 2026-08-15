public class Solution {
    public bool IsSumEqual(string firstWord, string secondWord, string targetWord) {
        int Convert(string word) {
            string s = "";
            foreach (char c in word) {
                s += (c - 'a').ToString();
            }
            return int.Parse(s);
        }
        return Convert(firstWord) + Convert(secondWord) == Convert(targetWord);
    }
}
