class Solution {
    public int minSwaps(String s) {
        int count0 = 0, count1 = 0;
        for (char c : s.toCharArray()) {
            if (c == '0') count0++;
            else count1++;
        }
        
        if (Math.abs(count0 - count1) > 1) return -1;
        
        int mismatch0 = 0, mismatch1 = 0;
        for (int i = 0; i < s.length(); i++) {
            char expected0 = i % 2 == 0 ? '0' : '1';
            char expected1 = i % 2 == 0 ? '1' : '0';
            if (s.charAt(i) != expected0) mismatch0++;
            if (s.charAt(i) != expected1) mismatch1++;
        }
        
        if (count0 == count1) return Math.min(mismatch0 / 2, mismatch1 / 2);
        if (count0 > count1) return mismatch0 / 2;
        return mismatch1 / 2;
    }
}
