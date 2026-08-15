public class Solution {
    public double TrimMean(int[] arr) {
        int n = arr.Length;
        int per5 = (int)(0.05 * n);
        Array.Sort(arr);
        double sum = 0;
        for (int i = per5; i < n - per5; i++) {
            sum += arr[i];
        }
        return sum / (n - per5 - per5);
    }
}
