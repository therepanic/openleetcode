using System;
using System.Linq;

public class Solution {
    public string LargestNumber(int[] nums) {
        string[] parts = nums.Select(num => num.ToString()).ToArray();
        Array.Sort(parts, (a, b) => string.CompareOrdinal(b + a, a + b));
        if (parts.Length > 0 && parts[0] == "0") return "0";
        return string.Concat(parts);
    }
}
