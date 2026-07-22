public class Solution {
    public string RemoveDuplicates(string s, int k) {
        var stack = new List<(char, int)>();
        foreach (char c in s) {
            if (stack.Count > 0 && stack[stack.Count - 1].Item1 == c) {
                stack[stack.Count - 1] = (c, stack[stack.Count - 1].Item2 + 1);
            } else {
                stack.Add((c, 1));
            }
            if (stack[stack.Count - 1].Item2 == k) {
                stack.RemoveAt(stack.Count - 1);
            }
        }
        var sb = new System.Text.StringBuilder();
        foreach (var (c, count) in stack) {
            sb.Append(c, count);
        }
        return sb.ToString();
    }
}
