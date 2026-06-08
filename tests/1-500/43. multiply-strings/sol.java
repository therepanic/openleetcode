public class Solution {
    public String multiply(String num1, String num2) {
        int n = num1.length();
        int m = num2.length();
        int[] result = new int[n + m];

        for (int i = n - 1; i >= 0; i--) {
            for (int j = m - 1; j >= 0; j--) {
                int mul = (num1.charAt(i) - '0') * (num2.charAt(j) - '0');
                int sum = mul + result[i + j + 1];
                result[i + j + 1] = sum % 10;
                result[i + j] += sum / 10;
            }
        }

        StringBuilder product = new StringBuilder();
        int k = 0;
        while (k < result.length && result[k] == 0) k++;
        if (k == result.length) return "0";
        for (; k < result.length; k++) {
            product.append(result[k]);
        }
        return product.toString();
    }
}
