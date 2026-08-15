class Solution {
    public boolean canChoose(int[][] groups, int[] nums) {
        int i = 0;
        for (int[] group : groups) {
            boolean found = false;
            while (i + group.length <= nums.length) {
                boolean match = true;
                for (int j = 0; j < group.length; j++) {
                    if (nums[i + j] != group[j]) {
                        match = false;
                        break;
                    }
                }
                if (match) {
                    i += group.length;
                    found = true;
                    break;
                } else {
                    i++;
                }
            }
            if (!found) return false;
        }
        return true;
    }
}
