class Solution {
    public int minAddToMakeValid(String s) {
        java.util.Stack<Character> l = new java.util.Stack<>();
        l.push('0');
        for (char i : s.toCharArray()) {
            if (l.peek() == '(' && i == ')') {
                l.pop();
            } else {
                l.push(i);
            }
        }
        return l.size() - 1;
    }
}
