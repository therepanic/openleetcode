import java.util.*;

class Solution {
    public List<List<Integer>> combinationSum3(int k, int n) {
        List<List<Integer>> res = new ArrayList<>();
        backtrack(1, new ArrayList<>(), n, k, res);
        return res;
    }

    private void backtrack(int start, List<Integer> path, int target, int k, List<List<Integer>> res) {
        if (target == 0 && k == 0) {
            res.add(new ArrayList<>(path));
            return;
        }
        for (int i = start; i <= 9; i++) {
            if (i > target || k <= 0) break;
            path.add(i);
            backtrack(i + 1, path, target - i, k - 1, res);
            path.remove(path.size() - 1);
        }
    }
}
