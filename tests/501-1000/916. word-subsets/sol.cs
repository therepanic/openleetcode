public class Solution {
    public IList<string> WordSubsets(string[] words1, string[] words2) {
        int[] maxCharFreq = new int[26];
        int[] tempCharFreq = new int[26];

        foreach (string word in words2) {
            foreach (char ch in word) {
                tempCharFreq[ch - 'a']++;
            }
            for (int i = 0; i < 26; i++) {
                maxCharFreq[i] = Math.Max(maxCharFreq[i], tempCharFreq[i]);
            }
            Array.Clear(tempCharFreq, 0, 26);
        }

        IList<string> universalWords = new List<string>();

        foreach (string word in words1) {
            foreach (char ch in word) {
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
                universalWords.Add(word);
            }
            Array.Clear(tempCharFreq, 0, 26);
        }

        return universalWords;
    }
}
