public class Solution {
    public int Calculate(string s) {
        Stack<int> stack = new Stack<int>();
        int n = 0;
        char op = '+';
        s += '+';
        
        foreach (char c in s) {
            if (c == ' ') continue;
            
            if (char.IsDigit(c)) {
                n = n * 10 + (c - '0');
                continue;
            }
            
            if (op == '+') {
                stack.Push(n);
            } else if (op == '-') {
                stack.Push(-n);
            } else if (op == '*') {
                stack.Push(stack.Pop() * n);
            } else if (op == '/') {
                stack.Push(stack.Pop() / n);
            }
            
            op = c;
            n = 0;
        }
        
        int result = 0;
        while (stack.Count > 0) {
            result += stack.Pop();
        }
        return result;
    }
}
