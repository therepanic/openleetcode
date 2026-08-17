public class Solution {
    public string MaximumNumber(string num, int[] change) {
        char[] a = num.ToCharArray();
        bool flag = false;
        for (int i = 0; i < a.Length; i++) {
            int b = a[i] - '0';
            if (b < change[b]) {
                a[i] = (char)(change[b] + '0');
                flag = true;
            } else if (b == change[b] || !flag) {
                continue;
            } else {
                break;
            }
        }
        return new string(a);
    }
}
