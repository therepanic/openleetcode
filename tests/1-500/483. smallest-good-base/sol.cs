using System;

public class Solution {
    public string SmallestGoodBase(string n) {
        ulong num = ulong.Parse(n);
        int maxM = (int)Math.Log(num, 2);
        for (int m = maxM; m >= 1; m--) {
            ulong left = 2;
            ulong right = (ulong)Math.Pow(num, 1.0 / m) + 1;
            while (left <= right) {
                ulong mid = left + (right - left) / 2;
                int cmp = Compare(mid, m, num);
                if (cmp == 0) {
                    return mid.ToString();
                }
                if (cmp < 0) {
                    left = mid + 1;
                } else {
                    right = mid - 1;
                }
            }
        }
        return (num - 1).ToString();
    }

    private int Compare(ulong @base, int m, ulong n) {
        decimal sum = 1;
        decimal cur = 1;
        for (int i = 0; i < m; i++) {
            cur *= @base;
            sum += cur;
            if (sum > n) {
                return 1;
            }
        }
        if (sum == n) return 0;
        return -1;
    }
}
