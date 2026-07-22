class Solution {
public:
    string alphabetBoardPath(string target) {
        vector<vector<int>> arr = {{0,1,2,3,4},{5,6,7,8,9},{10,11,12,13,14},{15,16,17,18,19},{20,21,22,23,24},{25}};
        vector<int> word;
        for (char c : target) {
            word.push_back(c - 'a');
        }
        string s = "";
        int j = 0, k = 0;
        if (word[0] % 5 != 0) {
            s += string(word[0] / 5, 'D');
        } else {
            s += string(word[0] / 5, 'D');
        }
        if (word[0] % 5 >= 0) {
            s += string(word[0] % 5, 'R');
        }
        s += '!';
        for (int i = 1; i < word.size(); i++) {
            for (int h = 0; h < arr.size(); h++) {
                for (int l = 0; l < arr[h].size(); l++) {
                    if (arr[h][l] == word[i-1]) j = h;
                    if (arr[h][l] == word[i]) k = h;
                }
            }
            if (word[i-1] == 25) {
                if (j > k) {
                    s += string(j - k, 'U');
                } else {
                    s += string(k - j, 'D');
                }
                if (word[i] % 5 >= word[i-1] % 5) {
                    s += string(word[i] % 5 - word[i-1] % 5, 'R');
                } else {
                    s += string(word[i-1] % 5 - word[i] % 5, 'L');
                }
            } else {
                if (word[i] % 5 >= word[i-1] % 5) {
                    s += string(word[i] % 5 - word[i-1] % 5, 'R');
                } else {
                    s += string(word[i-1] % 5 - word[i] % 5, 'L');
                }
                if (j > k) {
                    s += string(j - k, 'U');
                } else {
                    s += string(k - j, 'D');
                }
            }
            s += '!';
        }
        return s;
    }
};
