class Solution {
public:
    bool isSumEqual(string firstWord, string secondWord, string targetWord) {
        auto convert = [](const string& word) {
            string s;
            for (char c : word) {
                s += to_string(c - 'a');
            }
            return stoi(s);
        };
        return convert(firstWord) + convert(secondWord) == convert(targetWord);
    }
};
