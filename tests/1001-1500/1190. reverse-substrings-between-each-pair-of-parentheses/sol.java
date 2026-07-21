class Solution {
    private int i;

    public String reverseParentheses(String s) {
        i = 0;
        return helper(s);
    }

    private String helper(String s) {
        StringBuilder ans = new StringBuilder();
        while (i < s.length()) {
            if (s.charAt(i) == '(') {
                i++;
                ans.append(helper(s));
            } else if (s.charAt(i) == ')') {
                i++;
                return ans.reverse().toString();
            } else {
                ans.append(s.charAt(i));
                i++;
            }
        }
        return ans.toString();
    }
}
