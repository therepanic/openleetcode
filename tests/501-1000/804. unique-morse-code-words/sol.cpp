class Solution {
public:
    int uniqueMorseRepresentations(vector<string>& words) {
        vector<string> storage = {
            ".-", "-...", "-.-.", "-..", ".", "..-.", "--.",
            "....", "..", ".---", "-.-", ".-..", "--", "-.",
            "---", ".--.", "--.-", ".-.", "...", "-", "..-",
            "...-", ".--", "-..-", "-.--", "--.."
        };

        unordered_set<string> st;

        for (const string& word : words) {
            string temp = "";
            for (char ch : word) {
                temp += storage[ch - 'a'];
            }
            st.insert(temp);
        }

        return st.size();
    }
};
