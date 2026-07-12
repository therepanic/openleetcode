public class Solution {
    public int NumFriendRequests(int[] ages) {
        int[] cnt = new int[121];
        foreach (int age in ages) {
            cnt[age]++;
        }
        int[] pre = new int[122];
        for (int i = 0; i < 121; i++) {
            pre[i + 1] = pre[i] + cnt[i];
        }
        int ans = 0;
        for (int age = 15; age < 121; age++) {
            if (cnt[age] > 0) {
                int lower = (int)(age * 0.5 + 7);
                int total = pre[age + 1] - pre[lower + 1];
                ans += cnt[age] * (total - 1);
            }
        }
        return ans;
    }
}
