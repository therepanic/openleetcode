public class Solution {
    public string RemoveDuplicateLetters(string s) {
        Dictionary<char, int> lastOccur = new Dictionary<char, int>();
        for (int i = 0; i < s.Length; i++) {
            lastOccur[s[i]] = i;
        }
        
        Stack<char> stack = new Stack<char>();
        HashSet<char> visited = new HashSet<char>();
        
        for (int i = 0; i < s.Length; i++) {
            char c = s[i];
            if (visited.Contains(c)) {
                continue;
            }
            
            while (stack.Count > 0 && c < stack.Peek() && i < lastOccur[stack.Peek()]) {
                visited.Remove(stack.Pop());
            }
            
            visited.Add(c);
            stack.Push(c);
        }
        
        char[] result = stack.ToArray();
        Array.Reverse(result);
        return new string(result);
    }
}
