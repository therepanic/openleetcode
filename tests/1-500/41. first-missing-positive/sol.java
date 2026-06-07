import java.util.*;

public class Solution {
    public int firstMissingPositive(int[] nums) {
        Set<Integer> seen = new HashSet<>();
        for (int num : nums) {
            seen.add(num);
        }
        int i = 1;
        while (seen.contains(i)) {
            i++;
        }
        return i;
    }
}
