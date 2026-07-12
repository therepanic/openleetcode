class Solution {
    public String strWithout3a3b(int a, int b) {
        StringBuilder res = new StringBuilder();
        int prev_a = 0, prev_b = 0;
        
        while (a > 0 || b > 0) {
            if (prev_a == 2 && b > 0) {
                res.append("b");
                b--;
                prev_b++;
                prev_a = 0;
            } else if (prev_b == 2 && a > 0) {
                res.append("a");
                a--;
                prev_a++;
                prev_b = 0;
            } else if (a > b && a > 0) {
                res.append("a");
                a--;
                prev_a++;
            } else if (b > 0) {
                res.append("b");
                b--;
                prev_b++;
            }
        }
        return res.toString();
    }
}
