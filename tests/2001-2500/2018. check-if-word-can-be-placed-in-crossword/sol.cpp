class Solution {
public:
    bool placeWordInCrossword(vector<vector<char>>& board, string word) {
        auto can_place = [](const vector<char>& segment, const string& w) {
            if (segment.size() != w.size()) return false;
            for (size_t i = 0; i < segment.size(); ++i) {
                if (segment[i] != ' ' && segment[i] != w[i]) return false;
            }
            return true;
        };
        
        int m = board.size(), n = board[0].size();
        string reversed_word = word;
        reverse(reversed_word.begin(), reversed_word.end());
        
        for (auto& row : board) {
            vector<char> seg;
            for (char c : row) {
                if (c == '#') {
                    if (!seg.empty()) {
                        if (can_place(seg, word) || can_place(seg, reversed_word)) return true;
                        seg.clear();
                    }
                } else {
                    seg.push_back(c);
                }
            }
            if (!seg.empty()) {
                if (can_place(seg, word) || can_place(seg, reversed_word)) return true;
            }
        }
        
        for (int j = 0; j < n; ++j) {
            vector<char> seg;
            for (int i = 0; i < m; ++i) {
                char c = board[i][j];
                if (c == '#') {
                    if (!seg.empty()) {
                        if (can_place(seg, word) || can_place(seg, reversed_word)) return true;
                        seg.clear();
                    }
                } else {
                    seg.push_back(c);
                }
            }
            if (!seg.empty()) {
                if (can_place(seg, word) || can_place(seg, reversed_word)) return true;
            }
        }
        return false;
    }
};
