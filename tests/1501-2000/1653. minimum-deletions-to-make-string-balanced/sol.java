class Solution {
    public int minimumDeletions(String s) {
        int res = 0;
        int count = 0;
        for (char ch : s.toCharArray()) {
            if (ch == 'b') {
                count++;
            } else if (count > 0) {
                res++;
                count--;
            }
        }
        return res;
    }
}
