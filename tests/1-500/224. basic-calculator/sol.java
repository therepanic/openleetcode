class Solution {
    public int calculate(String s) {
        java.util.Stack<Integer> stack = new java.util.Stack<>();
        int res = 0;
        int curr = 0;
        int sign = 1;

        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (Character.isDigit(c)) {
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
                stack.push(res);
                stack.push(sign);
                res = 0;
                sign = 1;
            } else if (c == ')') {
                res += sign * curr;
                curr = 0;
                res *= stack.pop();
                res += stack.pop();
            }
        }

        res += sign * curr;
        return res;
    }
}
