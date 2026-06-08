public class Solution {
    public String getPermutation(int n, int k) {
        List<Integer> nums = new ArrayList<>();
        int[] factorial = new int[n + 1];
        factorial[0] = 1;

        for (int i = 1; i <= n; i++) {
            nums.add(i);
            factorial[i] = factorial[i - 1] * i;
        }

        k--;
        StringBuilder res = new StringBuilder();
        for (int remaining = n; remaining >= 1; remaining--) {
            int block = factorial[remaining - 1];
            int idx = k / block;
            k %= block;
            res.append(nums.get(idx));
            nums.remove(idx);
        }
        return res.toString();
    }
}
