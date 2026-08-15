import java.util.*;

class Solution {
    public List<Boolean> checkArithmeticSubarrays(int[] nums, int[] l, int[] r) {
        List<Boolean> ans = new ArrayList<>();
        for (int i = 0; i < l.length; i++) {
            int[] sub = Arrays.copyOfRange(nums, l[i], r[i]+1);
            Arrays.sort(sub);
            boolean valid = true;
            if (sub.length > 2) {
                int d = sub[1] - sub[0];
                for (int j = 1; j < sub.length-1; j++) {
                    if (sub[j+1] - sub[j] != d) {
                        valid = false;
                        break;
                    }
                }
            }
            ans.add(valid);
        }
        return ans;
    }
}
