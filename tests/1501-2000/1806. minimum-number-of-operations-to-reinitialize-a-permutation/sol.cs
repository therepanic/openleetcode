public class Solution {
    public int ReinitializePermutation(int n) {
        int[] original = new int[n];
        for (int i = 0; i < n; i++) original[i] = i;
        int[] permut = (int[])original.Clone();
        int[] arr = new int[n];
        int count = 0;
        while (true) {
            for (int i = 0; i < n; i++) {
                if (i % 2 == 0) {
                    arr[i] = permut[i / 2];
                } else {
                    arr[i] = permut[n / 2 + (i - 1) / 2];
                }
            }
            permut = (int[])arr.Clone();
            count++;
            bool equal = true;
            for (int i = 0; i < n; i++) {
                if (permut[i] != original[i]) {
                    equal = false;
                    break;
                }
            }
            if (equal) break;
        }
        return count;
    }
}
