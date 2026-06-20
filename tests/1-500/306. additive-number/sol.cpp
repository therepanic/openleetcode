class Solution {
public:
    bool isAdditiveNumber(string num) {
        auto addStrings = [](const string& a, const string& b) {
            string out;
            int i = (int)a.size() - 1;
            int j = (int)b.size() - 1;
            int carry = 0;
            while (i >= 0 || j >= 0 || carry) {
                int sum = carry;
                if (i >= 0) sum += a[i--] - '0';
                if (j >= 0) sum += b[j--] - '0';
                out.push_back(char('0' + (sum % 10)));
                carry = sum / 10;
            }
            return string(out.rbegin(), out.rend());
        };

        int n = (int)num.length();
        for (int i = 1; i < n; i++) {
            if (num[0] == '0' && i > 1) break;
            for (int j = i + 1; j < n; j++) {
                if (num[i] == '0' && j > i + 1) break;
                string a = num.substr(0, i);
                string b = num.substr(i, j - i);
                int k = j;
                int used = 2;
                while (k < n) {
                    string c = addStrings(a, b);
                    if (k + (int)c.length() > n || num.compare(k, c.length(), c) != 0) break;
                    k += (int)c.length();
                    a = b;
                    b = c;
                    used++;
                }
                if (k == n && used >= 3) return true;
            }
        }
        return false;
    }
};
