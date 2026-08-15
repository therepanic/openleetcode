class Solution {
public:
    bool threeConsecutiveOdds(vector<int>& arr) {
        string s = "";
        for (int x : arr) s += to_string(x & 1);
        return s.find("111") != string::npos;
    }
};
