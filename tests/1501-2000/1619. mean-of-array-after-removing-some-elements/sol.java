class Solution {
    public double trimMean(int[] arr) {
        int n = arr.length;
        int per5 = (int)(0.05 * n);
        Arrays.sort(arr);
        double sum = 0;
        for (int i = per5; i < n - per5; i++) {
            sum += arr[i];
        }
        return sum / (n - per5 - per5);
    }
}
