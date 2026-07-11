public class Solution {
    public string RemoveDuplicates(string s) {
        var stack = new System.Text.StringBuilder();
        foreach (char c in s) {
            if (stack.Length > 0 && stack[stack.Length - 1] == c) {
                stack.Length--;
            } else {
                stack.Append(c);
            }
        }
        return stack.ToString();
    }
}
