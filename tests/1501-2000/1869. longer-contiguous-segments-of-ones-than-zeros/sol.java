class Solution {
    public boolean checkZeroOnes(String s) {
        int max1 = 0, max0 = 0;
        int one = 0, zero = 0;
        
        for (char ch : s.toCharArray()) {
            if (ch == '1') {
                one++;
                zero = 0;
                max1 = Math.max(max1, one);
            } else {
                zero++;
                one = 0;
                max0 = Math.max(max0, zero);
            }
        }
        
        return max1 > max0;
    }
}
