public class Solution {
    public bool QueryString(string s, int n) {
        for (int num = n; num >= 1; num--) {
            string target = Convert.ToString(num, 2);
            int length = target.Length;
            int left = 0;
            bool valid = false;
            for (int right = 0; right < s.Length; right++) {
                while (right - left + 1 > length) {
                    left++;
                }
                if (s.Substring(left, right - left + 1) == target) {
                    valid = true;
                    break;
                }
            }
            if (!valid) {
                return false;
            }
        }
        return true;
    }
}
