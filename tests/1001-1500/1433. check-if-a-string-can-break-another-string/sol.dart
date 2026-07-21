class Solution {
  bool checkIfCanBreak(String s1, String s2) {
    List<int> freq = List.filled(26, 0);
    int n = s1.length;

    for (int i = 0; i < n; i++) {
      freq[s1.codeUnitAt(i) - 'a'.codeUnitAt(0)]++;
    }

    StringBuffer temp1 = StringBuffer();

    for (int i = 25; i >= 0; i--) {
      while (freq[i] > 0) {
        temp1.write(String.fromCharCode('a'.codeUnitAt(0) + i));
        freq[i]--;
      }
    }

    freq = List.filled(26, 0);

    for (int i = 0; i < n; i++) {
      freq[s2.codeUnitAt(i) - 'a'.codeUnitAt(0)]++;
    }

    StringBuffer temp2 = StringBuffer();

    for (int i = 25; i >= 0; i--) {
      while (freq[i] > 0) {
        temp2.write(String.fromCharCode('a'.codeUnitAt(0) + i));
        freq[i]--;
      }
    }

    String sorted1 = temp1.toString();
    String sorted2 = temp2.toString();

    bool all1 = true;
    bool all2 = true;

    for (int i = 0; i < n; i++) {
      if (sorted1.codeUnitAt(i) < sorted2.codeUnitAt(i)) {
        all1 = false;
      }
      if (sorted2.codeUnitAt(i) < sorted1.codeUnitAt(i)) {
        all2 = false;
      }
    }

    return all1 || all2;
  }
}
