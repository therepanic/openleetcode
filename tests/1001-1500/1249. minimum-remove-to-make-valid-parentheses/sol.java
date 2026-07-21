class Solution {
    public String minRemoveToMakeValid(String s) {
        StringBuilder t = new StringBuilder();
        int p = 0;
        for (char c : s.toCharArray()) {
            if (c == '(') p++;
            else if (c == ')') p--;
            if (p >= 0) {
                t.append(c);
            } else {
                p = 0;
            }
        }
        p = 0;
        StringBuilder result = new StringBuilder();
        String str = t.toString();
        for (int i = str.length() - 1; i >= 0; i--) {
            char c = str.charAt(i);
            if (c == '(') p++;
            else if (c == ')') p--;
            if (p <= 0) {
                result.append(c);
            } else {
                p = 0;
            }
        }
        return result.reverse().toString();
    }
}
