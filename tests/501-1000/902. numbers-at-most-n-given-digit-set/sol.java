class Solution {
    public int atMostNGivenDigitSet(String[] digits, int n) {
        int d = digits.length;
        String s = Integer.toString(n);
        int k = s.length();
        
        int ans;
        if (d == 1) {
            ans = k - 1;
        } else {
            ans = (int)((Math.pow(d, k) - d) / (d - 1));
        }
        
        for (int i = 0; i < k; i++) {
            char ch = s.charAt(i);
            int cnt = 0;
            for (String digit : digits) {
                if (digit.charAt(0) < ch) {
                    cnt++;
                }
            }
            ans += cnt * (int)Math.pow(d, k - i - 1);
            
            boolean found = false;
            for (String digit : digits) {
                if (digit.charAt(0) == ch) {
                    found = true;
                    break;
                }
            }
            if (!found) {
                break;
            }
            if (i == k - 1) {
                ans++;
            }
        }
        
        return ans;
    }
}
