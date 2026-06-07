import java.util.*;

public class Solution {
    public List<List<Integer>> combinationSum(int[] candidates, int target) {
        Arrays.sort(candidates);
        List<List<Integer>> res = new ArrayList<>();
        dfs(0, target, candidates, new ArrayList<>(), res);
        return res;
    }

    private void dfs(int start, int target, int[] candidates, List<Integer> cur, List<List<Integer>> res) {
        if (target == 0) {
            res.add(new ArrayList<>(cur));
            return;
        }

        for (int i = start; i < candidates.length; i++) {
            if (candidates[i] > target) break;
            cur.add(candidates[i]);
            dfs(i, target - candidates[i], candidates, cur, res);
            cur.remove(cur.size() - 1);
        }
    }
}
