class Solution {
public:
    string restoreString(string s, vector<int>& indices) {
        string res(indices.size(), ' ');
        for (int i = 0; i < indices.size(); i++) {
            res[indices[i]] = s[i];
        }
        return res;
    }
};
