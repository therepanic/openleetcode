class Solution {
public:
    string multiply(string num1, string num2) {
        int n = (int)num1.size();
        int m = (int)num2.size();
        vector<int> result(n + m, 0);

        for (int i = n - 1; i >= 0; i--) {
            for (int j = m - 1; j >= 0; j--) {
                int mul = (num1[i] - '0') * (num2[j] - '0');
                int sum = mul + result[i + j + 1];
                result[i + j + 1] = sum % 10;
                result[i + j] += sum / 10;
            }
        }

        string product;
        int k = 0;
        while (k < (int)result.size() && result[k] == 0) k++;
        if (k == (int)result.size()) return "0";
        for (; k < (int)result.size(); k++) {
            product.push_back(char('0' + result[k]));
        }
        return product;
    }
};
