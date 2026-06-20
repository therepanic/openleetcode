import java.util.*;

class Solution {
    public List<List<Integer>> findSubsequences(int[] nums) {
        Set<List<Integer>> result = new HashSet<>();
        backtrack(0, new ArrayList<>(), nums, result);
        return new ArrayList<>(result);
    }
    
    private void backtrack(int index, List<Integer> path, int[] nums, Set<List<Integer>> result) {
        if (path.size() >= 2) {
            result.add(new ArrayList<>(path));
        }
        for (int i = index; i < nums.length; i++) {
            if (path.isEmpty() || nums[i] >= path.get(path.size() - 1)) {
                path.add(nums[i]);
                backtrack(i + 1, path, nums, result);
                path.remove(path.size() - 1);
            }
        }
    }
}
