class Solution {
public:
    int longestSubstring(string s, int k) {
        int longestLen = 0;
        int n = s.size();

        for (int targetUniqueChars = 1; targetUniqueChars <= 26; targetUniqueChars++) {
            vector<int> charFreq(26, 0);
            int uniqueChars = 0;
            int charsMeetingKFreq = 0;
            int left = 0;

            for (int right = 0; right < n; right++) {
                int currIdx = s[right] - 'a';

                if (charFreq[currIdx] == 0) {
                    uniqueChars++;
                }
                if (charFreq[currIdx] == k - 1) {
                    charsMeetingKFreq++;
                }
                charFreq[currIdx]++;

                while (uniqueChars > targetUniqueChars) {
                    int leftIdx = s[left] - 'a';

                    if (charFreq[leftIdx] == 1) {
                        uniqueChars--;
                    }
                    if (charFreq[leftIdx] == k) {
                        charsMeetingKFreq--;
                    }
                    charFreq[leftIdx]--;
                    left++;
                }

                if (uniqueChars == targetUniqueChars && charsMeetingKFreq == uniqueChars) {
                    longestLen = max(longestLen, right - left + 1);
                }
            }
        }

        return longestLen;
    }
};
