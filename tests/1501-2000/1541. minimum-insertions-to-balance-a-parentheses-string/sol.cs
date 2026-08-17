public class Solution {
    public int MinInsertions(string s) {
        var stack = new System.Collections.Generic.Stack<char>();
        int count = 0;
        int i = 0;
        
        while (i < s.Length) {
            if (s[i] == '(') {
                stack.Push('(');
            } else {
                if (stack.Count == 0) {
                    if (i != s.Length - 1 && s[i + 1] == ')') {
                        count += 1;
                        i++;
                    } else {
                        count += 2;
                    }
                } else {
                    if (i != s.Length - 1 && s[i + 1] == ')') {
                        stack.Pop();
                        i++;
                    } else {
                        count += 1;
                        stack.Pop();
                    }
                }
            }
            i++;
        }
        
        return count + stack.Count * 2;
    }
}
