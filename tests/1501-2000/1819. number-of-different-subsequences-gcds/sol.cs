public class Solution {
    public int CountDifferentSubsequenceGCDs(int[] nums) {
        HashSet<int> seen = new HashSet<int>(nums);
        int maxi = nums.Max();
        int cnt = 0;
        for (int i = 1; i <= maxi; i++) {
            int gd = 0;
            for (int j = i; j <= maxi; j += i) {
                if (seen.Contains(j)) {
                    gd = Gcd(gd, j);
                }
            }
            if (gd == i) cnt++;
        }
        return cnt;
    }
    
    private int Gcd(int a, int b) {
        while (b != 0) {
            int temp = a % b;
            a = b;
            b = temp;
        }
        return a;
    }
}
