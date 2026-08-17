class Solution {
  bool checkIfPangram(String sentence) {
    if (sentence.length < 26) return false;
    
    for (int i = 0; i < 26; i++) {
      if (!sentence.contains(String.fromCharCode(97+i))) return false;
    }
    return true;
  }
}
