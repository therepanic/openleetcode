class Solution {
    public String reverseStr(String s, int k) {
        char[] arr = s.toCharArray();
        int step = 2 * k;
        for (int i = 0; i < arr.length; i += step) {
            int start = i;
            int end = Math.min(i + k - 1, arr.length - 1);
            while (start < end) {
                char tmp = arr[start];
                arr[start] = arr[end];
                arr[end] = tmp;
                start++;
                end--;
            }
        }
        return new String(arr);
    }
}
