class Solution {
    public int minCharacters(String a, String b) {
        int[] freqA = new int[26];
        int[] freqB = new int[26];

        for (char ch : a.toCharArray()) {
            freqA[ch - 'a']++;
        }
        for (char ch : b.toCharArray()) {
            freqB[ch - 'a']++;
        }

        int lenA = a.length();
        int lenB = b.length();
        int res = Integer.MAX_VALUE;
        int sumA = 0, sumB = 0;

        for (int i = 0; i < 25; i++) {
            sumA += freqA[i];
            sumB += freqB[i];
            res = Math.min(res, lenA - sumA + sumB);
            res = Math.min(res, lenB - sumB + sumA);
        }

        for (int i = 0; i < 26; i++) {
            res = Math.min(res, (lenA - freqA[i]) + (lenB - freqB[i]));
        }

        return res;
    }
}
