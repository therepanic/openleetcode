public class Solution {
    public int FindSpecialInteger(int[] arr) {
        int n = arr.Length;
        int q = n / 4;
        Dictionary<int, int> m = new Dictionary<int, int>();
        foreach (int num in arr) {
            if (m.ContainsKey(num)) {
                m[num]++;
            } else {
                m[num] = 1;
            }
            if (m[num] > q) {
                return num;
            }
        }
        return -1;
    }
}
