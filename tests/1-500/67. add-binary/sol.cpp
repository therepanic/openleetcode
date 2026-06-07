class Solution {
public:
    string addBinary(string a, string b) {
        string res;
        int i = static_cast<int>(a.size()) - 1;
        int j = static_cast<int>(b.size()) - 1;
        int carry = 0;

        while (i >= 0 || j >= 0 || carry > 0) {
            int sum = carry;
            if (i >= 0) {
                sum += a[i] - '0';
                --i;
            }
            if (j >= 0) {
                sum += b[j] - '0';
                --j;
            }
            res.push_back(static_cast<char>('0' + (sum % 2)));
            carry = sum / 2;
        }

        reverse(res.begin(), res.end());
        return res;
    }
};
