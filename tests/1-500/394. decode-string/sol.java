class Solution {
    private int i = 0;
    
    public String decodeString(String s) {
        return decode(s);
    }
    
    private String decode(String s) {
        StringBuilder res = new StringBuilder();
        int num = 0;
        while (i < s.length()) {
            char c = s.charAt(i);
            if (Character.isDigit(c)) {
                num = num * 10 + (c - '0');
                i++;
            } else if (c == '[') {
                i++;
                String inner = decode(s);
                for (int j = 0; j < num; j++) {
                    res.append(inner);
                }
                num = 0;
            } else if (c == ']') {
                i++;
                return res.toString();
            } else {
                res.append(c);
                i++;
            }
        }
        return res.toString();
    }
}
