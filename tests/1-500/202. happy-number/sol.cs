using System.Collections.Generic;

public class Solution {
    public bool IsHappy(int n) {
        var seen = new HashSet<int>();
        while (n != 1 && seen.Add(n)) {
            n = NextValue(n);
        }
        return n == 1;
    }

    private int NextValue(int n) {
        int total = 0;
        while (n > 0) {
            int digit = n % 10;
            total += digit * digit;
            n /= 10;
        }
        return total;
    }
}
