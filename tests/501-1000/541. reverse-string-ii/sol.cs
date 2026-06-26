public class Solution {
    public string ReverseStr(string s, int k) {
        char[] arr = s.ToCharArray();
        int step = 2 * k;
        for (int i = 0; i < arr.Length; i += step) {
            int start = i;
            int end = Math.Min(i + k - 1, arr.Length - 1);
            while (start < end) {
                char tmp = arr[start];
                arr[start] = arr[end];
                arr[end] = tmp;
                start++;
                end--;
            }
        }
        return new string(arr);
    }
}
