public class Solution {
    public string SmallestSubsequence(string s) {
        Dictionary<char, int> fqMap = new Dictionary<char, int>();
        Stack<char> stack = new Stack<char>();
        HashSet<char> visited = new HashSet<char>();
        foreach (char ch in s) {
            if (fqMap.ContainsKey(ch)) {
                fqMap[ch]++;
            } else {
                fqMap[ch] = 1;
            }
        }
        foreach (char ch in s) {
            fqMap[ch]--;
            if (visited.Contains(ch)) {
                continue;
            }
            while (stack.Count > 0 && ch < stack.Peek() && fqMap[stack.Peek()] > 0) {
                visited.Remove(stack.Pop());
            }
            visited.Add(ch);
            stack.Push(ch);
        }
        char[] result = stack.ToArray();
        Array.Reverse(result);
        return new string(result);
    }
}
