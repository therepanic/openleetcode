import java.util.*;

class Solution {
    public List<Integer> grayCode(int n) {
        int total = 1 << n;
        List<Integer> res = new ArrayList<>(total);
        for (int i = 0; i < total; i++) res.add(i ^ (i >> 1));
        return res;
    }
}
