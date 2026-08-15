public class Solution {
    public string MakeGood(string s) {
        var stack = new StringBuilder();
        foreach (char ch in s) {
            if (stack.Length > 0 && char.ToLower(ch) == char.ToLower(stack[stack.Length - 1]) && ch != stack[stack.Length - 1]) {
                stack.Length--;
            } else {
                stack.Append(ch);
            }
        }
        return stack.ToString();
    }
}
