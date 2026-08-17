class Solution {
    public int sumOddLengthSubarrays(int[] arr) {
        int s = 0;
        for (int x : arr) s += x;
        int l = arr.length - 1;
        int i = 2;
        while (l >= i) {
            int j = 0;
            int e = i;
            while (e <= l) {
                for (int k = j; k <= e; k++) s += arr[k];
                j++;
                e++;
            }
            i += 2;
        }
        return s;
    }
}
