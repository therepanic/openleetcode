public class Solution {
    public int[] ReplaceElements(int[] arr) {
        int maxElement = -1;
        for (int i = arr.Length - 1; i >= 0; i--) {
            int temp = arr[i];
            arr[i] = maxElement;
            maxElement = Math.Max(maxElement, temp);
        }
        return arr;
    }
}
