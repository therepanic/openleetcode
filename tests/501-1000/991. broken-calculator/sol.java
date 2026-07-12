class Solution {
    public int brokenCalc(int startValue, int target) {
        int ans = 0;
        while (target > startValue) {
            ans++;
            if (target % 2 == 1) {
                target += 1;
            } else {
                target /= 2;
            }
        }
        return ans + startValue - target;
    }
}
