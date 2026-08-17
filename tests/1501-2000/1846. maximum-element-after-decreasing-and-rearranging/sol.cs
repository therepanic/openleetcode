public class Solution {
    public int MaximumElementAfterDecrementingAndRearranging(int[] arr) {
        Array.Sort(arr);
        arr[0] = 1;
        for (int i = 1; i < arr.Length; i++) {
            arr[i] = Math.Min(arr[i], arr[i - 1] + 1);
        }
        return arr[arr.Length - 1];
    }
}
