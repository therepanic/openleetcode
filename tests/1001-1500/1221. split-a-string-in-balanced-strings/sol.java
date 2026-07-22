class Solution {
    public int balancedStringSplit(String s) {
        int bal = 0;
        int count = 0;
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (c == 'L') {
                bal++;
            } else if (c == 'R') {
                bal--;
            }
            if (bal == 0) {
                count++;
            }
        }
        return count;
    }
}
