class Solution {
public:
    int maximum69Number (int num) {
        string s = std::to_string(num);
        size_t pos = s.find('6');
        if (pos != string::npos) {
            s[pos] = '9';
        }
        return stoi(s);
    }
};
