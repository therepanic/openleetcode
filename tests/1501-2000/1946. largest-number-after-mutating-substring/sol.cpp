class Solution {
public:
    string maximumNumber(string num, vector<int>& change) {
        string a = num;
        bool flag = false;
        for (int i = 0; i < a.length(); i++) {
            int b = a[i] - '0';
            if (b < change[b]) {
                a[i] = change[b] + '0';
                flag = true;
            } else if (b == change[b] || !flag) {
                continue;
            } else {
                break;
            }
        }
        return a;
    }
};
