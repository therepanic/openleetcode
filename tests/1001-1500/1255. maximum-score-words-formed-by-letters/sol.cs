public class Solution {
    private int ans = 0;
    
    public int MaxScoreWords(string[] words, char[] letters, int[] score) {
        int[] freq = new int[26];
        foreach (char c in letters) {
            freq[c - 'a']++;
        }
        
        ans = 0;
        Comb(0, words, freq, score, 0);
        return ans;
    }
    
    private void Comb(int i, string[] words, int[] freq, int[] score, int total) {
        if (i == words.Length) {
            ans = Math.Max(ans, total);
            return;
        }
        
        int[] same = (int[])freq.Clone();
        int rem = total;
        int[] tempFreq = (int[])freq.Clone();
        bool full = true;
        int newTotal = total;
        
        foreach (char ch in words[i]) {
            int idx = ch - 'a';
            if (tempFreq[idx] == 0) {
                full = false;
                break;
            }
            tempFreq[idx]--;
            newTotal += score[idx];
        }
        
        if (full) {
            Comb(i + 1, words, tempFreq, score, newTotal);
            Comb(i + 1, words, same, score, rem);
        } else {
            Comb(i + 1, words, same, score, rem);
        }
    }
}
