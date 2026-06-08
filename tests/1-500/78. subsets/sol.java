import java.util.*;

class Solution {
    public List<List<Integer>> subsets(int[] nums) {
        List<List<Integer>> res = new ArrayList<>();
        res.add(new ArrayList<>());
        for (int x : nums) {
            int sz = res.size();
            for (int i = 0; i < sz; i++) {
                List<Integer> cur = new ArrayList<>(res.get(i));
                cur.add(x);
                res.add(cur);
            }
        }
        return res;
    }
}
