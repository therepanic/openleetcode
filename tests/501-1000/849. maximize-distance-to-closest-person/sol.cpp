class Solution {
public:
    int maxDistToClosest(vector<int>& seats) {
        string s;
        for (int x : seats) s += to_string(x);
        vector<int> lens;
        size_t pos = 0;
        string token;
        while ((pos = s.find('1')) != string::npos) {
            token = s.substr(0, pos);
            lens.push_back(token.length());
            s.erase(0, pos + 1);
        }
        lens.push_back(s.length());
        int maxVal = *max_element(lens.begin(), lens.end());
        return max({lens[0], (maxVal + 1) / 2, lens.back()});
    }
};
