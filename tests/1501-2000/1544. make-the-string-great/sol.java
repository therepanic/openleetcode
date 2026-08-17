class Solution {
    public String makeGood(String s) {
        StringBuilder stack = new StringBuilder();
        for (char ch : s.toCharArray()) {
            if (stack.length() > 0 && Character.toLowerCase(ch) == Character.toLowerCase(stack.charAt(stack.length() - 1)) && ch != stack.charAt(stack.length() - 1)) {
                stack.deleteCharAt(stack.length() - 1);
            } else {
                stack.append(ch);
            }
        }
        return stack.toString();
    }
}
