class Solution {
public:
    vector<int> selfDividingNumbers(int left, int right) {
        vector<int> lst;
        for (int i = left; i <= right; i++) {
            string s = to_string(i);
            if (s.find('0') != string::npos) continue;
            int b = 1;
            for (char c : s) {
                int digit = c - '0';
                if (i % digit != 0) {
                    b = 0;
                    break;
                }
            }
            if (b == 1) lst.push_back(i);
        }
        return lst;
    }
};
