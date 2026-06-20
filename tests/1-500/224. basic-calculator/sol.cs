public class Solution {
    public int Calculate(string s) {
        Stack<int> stack = new Stack<int>();
        int res = 0;
        int curr = 0;
        int sign = 1;

        foreach (char c in s) {
            if (Char.IsDigit(c)) {
                curr = curr * 10 + (c - '0');
            } else if (c == '+') {
                res += sign * curr;
                sign = 1;
                curr = 0;
            } else if (c == '-') {
                res += sign * curr;
                sign = -1;
                curr = 0;
            } else if (c == '(') {
                stack.Push(res);
                stack.Push(sign);
                res = 0;
                sign = 1;
            } else if (c == ')') {
                res += sign * curr;
                curr = 0;
                res *= stack.Pop();
                res += stack.Pop();
            }
        }

        res += sign * curr;
        return res;
    }
}
