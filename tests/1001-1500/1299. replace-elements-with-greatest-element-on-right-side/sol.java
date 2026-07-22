class Solution {
    public int[] replaceElements(int[] arr) {
        int maxElement = -1;
        for (int i = arr.length - 1; i >= 0; i--) {
            int temp = arr[i];
            arr[i] = maxElement;
            maxElement = Math.max(maxElement, temp);
        }
        return arr;
    }
}
