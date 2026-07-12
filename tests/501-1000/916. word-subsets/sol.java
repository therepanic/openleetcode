class Solution {
    public List<String> wordSubsets(String[] words1, String[] words2) {
        int[] maxCharFreq = new int[26];
        int[] tempCharFreq = new int[26];

        for (String word : words2) {
            for (char ch : word.toCharArray()) {
                tempCharFreq[ch - 'a']++;
            }
            for (int i = 0; i < 26; i++) {
                maxCharFreq[i] = Math.max(maxCharFreq[i], tempCharFreq[i]);
            }
            Arrays.fill(tempCharFreq, 0);
        }

        List<String> universalWords = new ArrayList<>();

        for (String word : words1) {
            for (char ch : word.toCharArray()) {
                tempCharFreq[ch - 'a']++;
            }
            boolean isUniversal = true;
            for (int i = 0; i < 26; i++) {
                if (maxCharFreq[i] > tempCharFreq[i]) {
                    isUniversal = false;
                    break;
                }
            }
            if (isUniversal) {
                universalWords.add(word);
            }
            Arrays.fill(tempCharFreq, 0);
        }

        return universalWords;
    }
}
