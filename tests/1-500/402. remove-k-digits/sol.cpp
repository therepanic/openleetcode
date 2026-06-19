class Solution {
public:
    string removeKdigits(string num, int k) {
        string s;
        for (char c : num) {
            while (k > 0 && !s.empty() && s.back() > c) {
                s.pop_back();
                k--;
            }
            s.push_back(c);
        }
        
        s.resize(s.length() - k);
        size_t pos = s.find_first_not_of('0');
        return pos == string::npos ? "0" : s.substr(pos);
    }
};
