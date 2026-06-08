using System.Collections.Generic;

public class Solution {
    public int FirstMissingPositive(int[] nums) {
        var seen = new HashSet<int>(nums);
        int i = 1;
        while (seen.Contains(i)) {
            i++;
        }
        return i;
    }
}
