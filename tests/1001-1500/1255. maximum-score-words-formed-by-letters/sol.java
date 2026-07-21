class Solution {
    private int ans = 0;
    
    public int maxScoreWords(String[] words, char[] letters, int[] score) {
        int[] freq = new int[26];
        for (char c : letters) {
            freq[c - 'a']++;
        }
        
        ans = 0;
        comb(0, words, freq, score, 0);
        return ans;
    }
    
    private void comb(int i, String[] words, int[] freq, int[] score, int total) {
        if (i == words.length) {
            ans = Math.max(ans, total);
            return;
        }
        
        int[] same = freq.clone();
        int rem = total;
        boolean full = true;
        
        for (char ch : words[i].toCharArray()) {
            int idx = ch - 'a';
            if (freq[idx] == 0) {
                full = false;
                break;
            } else {
                freq[idx]--;
                total += score[idx];
            }
        }
        
        if (full) {
            comb(i + 1, words, freq, score, total);
            comb(i + 1, words, same, score, rem);
        } else {
            comb(i + 1, words, same, score, rem);
        }
    }
}
