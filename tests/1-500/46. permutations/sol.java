import java.util.*;

public class Solution {
    public List<List<Integer>> permute(int[] nums) {
        List<List<Integer>> res = new ArrayList<>();
        dfs(0, nums, res);
        return res;
    }

    private void dfs(int i, int[] nums, List<List<Integer>> res) {
        if (i == nums.length) {
            List<Integer> cur = new ArrayList<>();
            for (int num : nums) cur.add(num);
            res.add(cur);
            return;
        }

        for (int j = i; j < nums.length; j++) {
            int tmp = nums[i];
            nums[i] = nums[j];
            nums[j] = tmp;
            dfs(i + 1, nums, res);
            tmp = nums[i];
            nums[i] = nums[j];
            nums[j] = tmp;
        }
    }
}
