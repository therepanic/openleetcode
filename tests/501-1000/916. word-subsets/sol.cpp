class Solution {
public:
    vector<string> wordSubsets(vector<string>& words1, vector<string>& words2) {
        vector<int> maxCharFreq(26, 0);
        vector<int> tempCharFreq(26, 0);

        for (const string& word : words2) {
            for (char ch : word) {
                tempCharFreq[ch - 'a']++;
            }
            for (int i = 0; i < 26; i++) {
                maxCharFreq[i] = max(maxCharFreq[i], tempCharFreq[i]);
            }
            fill(tempCharFreq.begin(), tempCharFreq.end(), 0);
        }

        vector<string> universalWords;

        for (const string& word : words1) {
            for (char ch : word) {
                tempCharFreq[ch - 'a']++;
            }
            bool isUniversal = true;
            for (int i = 0; i < 26; i++) {
                if (maxCharFreq[i] > tempCharFreq[i]) {
                    isUniversal = false;
                    break;
                }
            }
            if (isUniversal) {
                universalWords.push_back(word);
            }
            fill(tempCharFreq.begin(), tempCharFreq.end(), 0);
        }

        return universalWords;
    }
};
