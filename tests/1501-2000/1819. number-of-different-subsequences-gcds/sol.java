class Solution {
    public int countDifferentSubsequenceGCDs(int[] nums) {
        Set<Integer> seen = new HashSet<>();
        int maxi = 0;
        for (int num : nums) {
            seen.add(num);
            maxi = Math.max(maxi, num);
        }
        int cnt = 0;
        for (int i = 1; i <= maxi; i++) {
            int gd = 0;
            for (int j = i; j <= maxi; j += i) {
                if (seen.contains(j)) {
                    gd = gcd(gd, j);
                }
            }
            if (gd == i) cnt++;
        }
        return cnt;
    }
    
    private int gcd(int a, int b) {
        while (b != 0) {
            int temp = a % b;
            a = b;
            b = temp;
        }
        return a;
    }
}
