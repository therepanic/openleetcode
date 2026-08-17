public class Solution {
    public int SumOddLengthSubarrays(int[] arr) {
        int s = arr.Sum();
        int l = arr.Length - 1;
        int i = 2;
        while (l >= i) {
            int j = 0;
            int e = i;
            while (e <= l) {
                for (int k = j; k <= e; k++) {
                    s += arr[k];
                }
                j++;
                e++;
            }
            i += 2;
        }
        return s;
    }
}
