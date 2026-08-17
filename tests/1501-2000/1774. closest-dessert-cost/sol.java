import java.util.*;

class Solution {
    public int closestCost(int[] baseCosts, int[] toppingCosts, int target) {
        List<Integer> s = new ArrayList<>();
        s.add(0);
        for (int i : toppingCosts) {
            List<Integer> ss = new ArrayList<>();
            for (int j : s) {
                ss.add(j);
                ss.add(j + i);
                ss.add(j + 2 * i);
            }
            s = ss;
        }
        Collections.sort(s);
        int ans = 1000000000;
        int fans = 1000000000;
        int n = s.size();
        for (int i : baseCosts) {
            int j = target - i;
            int x = Collections.binarySearch(s, j);
            if (x < 0) x = -x - 2;
            x = Math.max(x, 0);
            int ans1 = Math.abs(j - s.get(x));
            if (ans1 < ans) {
                ans = ans1;
                fans = s.get(x) + i;
            } else if (ans1 == ans) {
                fans = Math.min(fans, s.get(x) + i);
            }
            if (x + 1 < n) {
                x++;
                ans1 = Math.abs(j - s.get(x));
                if (ans1 < ans) {
                    ans = ans1;
                    fans = s.get(x) + i;
                } else if (ans1 == ans) {
                    fans = Math.min(fans, s.get(x) + i);
                }
            }
        }
        return fans;
    }
}
