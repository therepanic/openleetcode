class Solution {
    public boolean canArrange(int[] arr, int k) {
        int n = arr.length;
        int[] a = new int[n];
        for (int i = 0; i < n; i++) {
            a[i] = ((arr[i] % k) + k) % k;
        }
        Arrays.sort(a);
        int j = 0;
        while (j < n && a[j] == 0) j++;
        if (j % 2 != 0) return false;
        for (int l = j, r = n - 1; l < r; l++, r--) {
            if ((a[l] + a[r]) % k != 0) return false;
        }
        return true;
    }
}
