public class Solution {
    public int[] DiStringMatch(string s) {
        int low = 0, high = s.Length;
        int[] result = new int[s.Length + 1];
        for (int i = 0; i < s.Length; i++) {
            if (s[i] == 'I') {
                result[i] = low++;
            } else {
                result[i] = high--;
            }
        }
        result[s.Length] = low;
        return result;
    }
}
