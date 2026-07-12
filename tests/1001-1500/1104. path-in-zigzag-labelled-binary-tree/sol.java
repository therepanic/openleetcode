import java.util.*;

class Solution {
    public List<Integer> pathInZigZagTree(int label) {
        List<Integer> res = new ArrayList<>();
        int cur = label;
        while (cur > 0) {
            res.add(cur);
            int start = 1;
            while (start * 2 <= cur) {
                start *= 2;
            }
            int end = start * 2 - 1;
            cur = (start + end - cur) / 2;
        }
        Collections.reverse(res);
        return res;
    }
}
