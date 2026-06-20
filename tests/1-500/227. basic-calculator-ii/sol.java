class Solution {
    public int calculate(String s) {
        Stack<Integer> stack = new Stack<>();
        int n = 0;
        char op = '+';
        s += '+';
        
        for (char c : s.toCharArray()) {
            if (c == ' ') continue;
            
            if (Character.isDigit(c)) {
                n = n * 10 + (c - '0');
                continue;
            }
            
            if (op == '+') {
                stack.push(n);
            } else if (op == '-') {
                stack.push(-n);
            } else if (op == '*') {
                stack.push(stack.pop() * n);
            } else if (op == '/') {
                stack.push(stack.pop() / n);
            }
            
            op = c;
            n = 0;
        }
        
        int result = 0;
        for (int num : stack) {
            result += num;
        }
        return result;
    }
}
