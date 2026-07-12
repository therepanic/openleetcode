public class Solution {
    public int[] RelativeSortArray(int[] arr1, int[] arr2) {
        int[] freq = new int[1001];
        foreach (int num in arr1) {
            freq[num]++;
        }
        int idx = 0;
        foreach (int num in arr2) {
            while (freq[num] > 0) {
                arr1[idx++] = num;
                freq[num]--;
            }
        }
        for (int num = 0; num < 1001; num++) {
            while (freq[num] > 0) {
                arr1[idx++] = num;
                freq[num]--;
            }
        }
        return arr1;
    }
}
