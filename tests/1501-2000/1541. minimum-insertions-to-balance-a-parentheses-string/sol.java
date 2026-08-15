class Solution {
    public int minInsertions(String s) {
        java.util.Stack<Character> stack = new java.util.Stack<>();
        int count = 0;
        int i = 0;
        
        while (i < s.length()) {
            if (s.charAt(i) == '(') {
                stack.push('(');
            } else {
                if (stack.isEmpty()) {
                    if (i != s.length() - 1 && s.charAt(i + 1) == ')') {
                        count += 1;
                        i++;
                    } else {
                        count += 2;
                    }
                } else {
                    if (i != s.length() - 1 && s.charAt(i + 1) == ')') {
                        stack.pop();
                        i++;
                    } else {
                        count += 1;
                        stack.pop();
                    }
                }
            }
            i++;
        }
        
        return count + stack.size() * 2;
    }
}
