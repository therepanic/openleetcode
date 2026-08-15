class Solution {
public:
    int getLucky(string s, int k) {
        string res = "";
        for (char c : s) {
            res += to_string(c - 'a' + 1);
        }
        for (int i = 0; i < k; i++) {
            int sum = 0;
            for (char c : res) {
                sum += c - '0';
            }
            res = to_string(sum);
        }
        return stoi(res);
    }
};
