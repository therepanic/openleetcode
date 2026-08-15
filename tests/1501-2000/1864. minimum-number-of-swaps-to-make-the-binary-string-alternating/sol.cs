public class Solution {
    public int MinSwaps(string s) {
        int count0 = 0, count1 = 0;
        foreach (char c in s) {
            if (c == '0') count0++;
            else count1++;
        }
        
        if (Math.Abs(count0 - count1) > 1) return -1;
        
        int mismatch0 = 0, mismatch1 = 0;
        for (int i = 0; i < s.Length; i++) {
            char expected0 = i % 2 == 0 ? '0' : '1';
            char expected1 = i % 2 == 0 ? '1' : '0';
            if (s[i] != expected0) mismatch0++;
            if (s[i] != expected1) mismatch1++;
        }
        
        if (count0 == count1) return Math.Min(mismatch0 / 2, mismatch1 / 2);
        if (count0 > count1) return mismatch0 / 2;
        return mismatch1 / 2;
    }
}
