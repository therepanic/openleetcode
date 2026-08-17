class Solution {
  int minCharacters(String a, String b) {
    List<int> freqA = List.filled(26, 0);
    List<int> freqB = List.filled(26, 0);

    for (int i = 0; i < a.length; i++) {
      freqA[a.codeUnitAt(i) - 97]++;
    }
    for (int i = 0; i < b.length; i++) {
      freqB[b.codeUnitAt(i) - 97]++;
    }

    int lenA = a.length;
    int lenB = b.length;
    int res = 1 << 30;
    int sumA = 0, sumB = 0;

    for (int i = 0; i < 25; i++) {
      sumA += freqA[i];
      sumB += freqB[i];
      res = res < (lenA - sumA + sumB) ? res : lenA - sumA + sumB;
      res = res < (lenB - sumB + sumA) ? res : lenB - sumB + sumA;
    }

    for (int i = 0; i < 26; i++) {
      int temp = (lenA - freqA[i]) + (lenB - freqB[i]);
      res = res < temp ? res : temp;
    }

    return res;
  }
}
