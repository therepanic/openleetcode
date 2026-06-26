class Solution {
    public int arrayPairSum(int[] nums) {
        int[] bucket = new int[20001];
        for (int x : nums) {
            bucket[x + 10000]++;
        }
        int res = 0;
        boolean flag = true;
        for (int i = 0; i < 20001; i++) {
            while (bucket[i] > 0) {
                if (flag) {
                    res += i - 10000;
                }
                flag = !flag;
                bucket[i]--;
            }
        }
        return res;
    }
}
