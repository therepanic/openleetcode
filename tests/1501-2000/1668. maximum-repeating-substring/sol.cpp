class Solution {
public:
    int maxRepeating(string sequence, string word) {
        string temp = word;
        int res = 0;
        while (sequence.find(temp) != string::npos) {
            res++;
            temp += word;
        }
        return res;
    }
};
