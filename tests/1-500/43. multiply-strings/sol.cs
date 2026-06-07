public class Solution {
    public string Multiply(string num1, string num2) {
        int n = num1.Length;
        int m = num2.Length;
        int[] result = new int[n + m];

        for (int i = n - 1; i >= 0; i--) {
            for (int j = m - 1; j >= 0; j--) {
                int mul = (num1[i] - '0') * (num2[j] - '0');
                int sum = mul + result[i + j + 1];
                result[i + j + 1] = sum % 10;
                result[i + j] += sum / 10;
            }
        }

        int k = 0;
        while (k < result.Length && result[k] == 0) k++;
        if (k == result.Length) return "0";

        var product = new System.Text.StringBuilder();
        for (; k < result.Length; k++) {
            product.Append(result[k]);
        }
        return product.ToString();
    }
}
