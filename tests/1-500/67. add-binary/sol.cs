using System.Text;

public class Solution {
    public string AddBinary(string a, string b) {
        var res = new StringBuilder();
        int i = a.Length - 1;
        int j = b.Length - 1;
        int carry = 0;

        while (i >= 0 || j >= 0 || carry > 0) {
            int sum = carry;
            if (i >= 0) {
                sum += a[i] - '0';
                i--;
            }
            if (j >= 0) {
                sum += b[j] - '0';
                j--;
            }
            res.Append((char)('0' + (sum % 2)));
            carry = sum / 2;
        }

        char[] chars = new char[res.Length];
        for (int idx = 0; idx < res.Length; idx++) {
            chars[idx] = res[res.Length - 1 - idx];
        }
        return new string(chars);
    }
}
