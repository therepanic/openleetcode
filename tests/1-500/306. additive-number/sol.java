public class Solution {
    public boolean isAdditiveNumber(String num) {
        java.util.function.BiFunction<String, String, String> addStrings = (a, b) -> {
            StringBuilder sb = new StringBuilder();
            int i = a.length() - 1, j = b.length() - 1, carry = 0;
            while (i >= 0 || j >= 0 || carry != 0) {
                int sum = carry;
                if (i >= 0) sum += a.charAt(i--) - '0';
                if (j >= 0) sum += b.charAt(j--) - '0';
                sb.append((char) ('0' + (sum % 10)));
                carry = sum / 10;
            }
            return sb.reverse().toString();
        };

        int n = num.length();
        for (int i = 1; i < n; i++) {
            if (num.charAt(0) == '0' && i > 1) break;
            for (int j = i + 1; j < n; j++) {
                if (num.charAt(i) == '0' && j > i + 1) break;
                String a = num.substring(0, i);
                String b = num.substring(i, j);
                int k = j;
                int used = 2;
                while (k < n) {
                    String c = addStrings.apply(a, b);
                    if (k + c.length() > n || !num.startsWith(c, k)) break;
                    k += c.length();
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
