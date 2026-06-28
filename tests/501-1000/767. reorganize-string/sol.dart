class Solution {
  String reorganizeString(String s) {
    Map<String, int> charFreq = {};
    for (var c in s.split('')) {
      charFreq[c] = (charFreq[c] ?? 0) + 1;
    }
    
    List<List<int>> maxHeap = [];
    charFreq.forEach((char, freq) {
      maxHeap.add([freq, char.codeUnitAt(0)]);
    });
    
    maxHeap.sort((a, b) => b[0].compareTo(a[0]));
    
    List<String> res = [];
    int prevFreq = 0;
    String prevChar = '';
    
    while (maxHeap.isNotEmpty) {
      var curr = maxHeap.removeAt(0);
      int freq = curr[0];
      String c = String.fromCharCode(curr[1]);
      
      res.add(c);
      
      if (prevFreq > 0) {
        maxHeap.add([prevFreq, prevChar.codeUnitAt(0)]);
        maxHeap.sort((a, b) => b[0].compareTo(a[0]));
      }
      
      prevFreq = freq - 1;
      prevChar = c;
    }
    
    if (res.length != s.length) return '';
    return res.join();
  }
}
