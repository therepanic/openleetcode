public class Solution {
    public string ReverseVowels(string s) {
        char[] chars = s.ToCharArray();
        string vowels = "aeiouAEIOU";
        int i = 0, j = chars.Length - 1;
        while (i < j) {
            while (i < j && !vowels.Contains(chars[i])) {
                i++;
            }
            while (i < j && !vowels.Contains(chars[j])) {
                j--;
            }
            char temp = chars[i];
            chars[i] = chars[j];
            chars[j] = temp;
            i++;
            j--;
        }
        return new string(chars);
    }
}
