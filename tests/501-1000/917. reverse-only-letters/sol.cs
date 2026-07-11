public class Solution {
    public string ReverseOnlyLetters(string s) {
        char[] chars = s.ToCharArray();
        int start = 0;
        int end = chars.Length - 1;
        while (true) {
            if (start >= end) {
                break;
            }
            
            if (char.IsLetter(chars[start]) && char.IsLetter(chars[end])) {
                char temp = chars[start];
                chars[start] = chars[end];
                chars[end] = temp;
                start++;
                end--;
            } else if (!char.IsLetter(chars[start])) {
                start++;
            } else {
                end--;
            }
        }
        
        return new string(chars);
    }
}
