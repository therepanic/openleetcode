class Solution {
    public int scoreOfParentheses(String s) {
        int[] score_stack = new int[s.length() + 1];
        int top = 0;
        score_stack[0] = 0;
        
        for (int i = 0; i < s.length(); i++) {
            char parentheses = s.charAt(i);
            if (parentheses == '(') {
                top++;
                score_stack[top] = 0;
            } else if (top >= 0) {
                int last_score = score_stack[top];
                top--;
                score_stack[top] += Math.max(1, last_score * 2);
            }
        }
        
        return score_stack[0];
    }
}
