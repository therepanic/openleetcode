public class Solution {
    public bool IsAdditiveNumber(string num) {
        string AddStrings(string a, string b) {
            int i = a.Length - 1, j = b.Length - 1, carry = 0;
            var sb = new System.Text.StringBuilder();
            while (i >= 0 || j >= 0 || carry != 0) {
                int sum = carry;
                if (i >= 0) sum += a[i--] - '0';
                if (j >= 0) sum += b[j--] - '0';
                sb.Append((char)('0' + (sum % 10)));
                carry = sum / 10;
            }
            var chars = sb.ToString().ToCharArray();
            Array.Reverse(chars);
            return new string(chars);
        }

        int n = num.Length;
        for (int i = 1; i < n; i++) {
            if (num[0] == '0' && i > 1) break;
            for (int j = i + 1; j < n; j++) {
                if (num[i] == '0' && j > i + 1) break;
                string a = num.Substring(0, i);
                string b = num.Substring(i, j - i);
                int k = j;
                int used = 2;
                while (k < n) {
                    string c = AddStrings(a, b);
                    if (k + c.Length > n || num.Substring(k, c.Length) != c) break;
                    k += c.Length;
                    a = b;
                    b = c;
                    used++;
                }
                if (k == n && used >= 3) return true;
            }
        }
        return false;
    }
}
