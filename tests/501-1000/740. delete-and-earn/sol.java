import java.util.*;

class Solution {
    public int deleteAndEarn(int[] nums) {
        Map<Integer, Integer> count = new HashMap<>();
        for (int num : nums) {
            count.put(num, count.getOrDefault(num, 0) + 1);
        }
        List<Integer> uniqueNums = new ArrayList<>(count.keySet());
        Collections.sort(uniqueNums);
        Integer prev = null;
        int take = 0, skip = 0;

        for (int num : uniqueNums) {
            int maxPoints = Math.max(skip, take);
            if (prev != null && prev == num - 1) {
                take = num * count.get(num) + skip;
                skip = maxPoints;
            } else {
                take = num * count.get(num) + maxPoints;
                skip = maxPoints;
            }
            prev = num;
        }

        return Math.max(take, skip);
    }
}
