import java.util.*;

class Solution {
    public int[] avoidFlood(int[] rains) {
        int n = rains.length;
        int[] res = new int[n];
        Arrays.fill(res, -1);
        Map<Integer, Integer> full = new HashMap<>();
        TreeSet<Integer> dry = new TreeSet<>();
        for (int i = 0; i < n; i++) {
            int lake = rains[i];
            if (lake == 0) {
                dry.add(i);
                res[i] = 1;
            } else if (full.containsKey(lake)) {
                Integer j = dry.higher(full.get(lake));
                if (j == null) {
                    return new int[0];
                }
                res[j] = lake;
                dry.remove(j);
                full.put(lake, i);
            } else {
                full.put(lake, i);
            }
        }
        return res;
    }
}
