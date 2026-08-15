class Solution {
    public int reinitializePermutation(int n) {
        int[] original = new int[n];
        for (int i = 0; i < n; i++) original[i] = i;
        int[] permut = original.clone();
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
            permut = arr.clone();
            count++;
            if (java.util.Arrays.equals(permut, original)) break;
        }
        return count;
    }
}
