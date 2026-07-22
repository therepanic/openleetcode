class Solution {
  int maxScoreWords(List<String> words, List<String> letters, List<int> score) {
    List<int> freq = List.filled(26, 0);
    for (var c in letters) {
      freq[c.codeUnitAt(0) - 'a'.codeUnitAt(0)]++;
    }
    
    int ans = 0;
    
    void comb(int i, List<int> freq, int total) {
      if (i == words.length) {
        if (total > ans) ans = total;
        return;
      }
      
      List<int> same = List.from(freq);
      int rem = total;
      List<int> tempFreq = List.from(freq);
      bool full = true;
      
      for (var ch in words[i].split('')) {
        int idx = ch.codeUnitAt(0) - 'a'.codeUnitAt(0);
        if (tempFreq[idx] == 0) {
          full = false;
          break;
        }
        tempFreq[idx]--;
        total += score[idx];
      }
      
      if (full) {
        comb(i + 1, tempFreq, total);
        comb(i + 1, same, rem);
      } else {
        comb(i + 1, same, rem);
      }
    }
    
    comb(0, freq, 0);
    return ans;
  }
}
