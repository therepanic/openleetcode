public class Solution {
    public bool IncreasingTriplet(int[] nums) {
        int a = int.MaxValue;
        int b = int.MaxValue;
        bool f = false;
        foreach (int x in nums) {
            if (x <= a) {
                a = x;
            } else if (x <= b) {
                b = x;
            } else {
                f = true;
            }
        }
        return f;
    }
}
