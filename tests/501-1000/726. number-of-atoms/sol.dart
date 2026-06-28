class Solution {
  String countOfAtoms(String formula) {
    int i = 0;
    var atomsFreq = <String, int>{};
    var result = decodeAtomsHelper(i, formula);
    atomsFreq = result.items1;
    
    var sortedKeys = atomsFreq.keys.toList()..sort();
    var decodedFormula = StringBuffer();
    
    for (var key in sortedKeys) {
      decodedFormula.write(key);
      if (atomsFreq[key]! > 1) {
        decodedFormula.write(atomsFreq[key]);
      }
    }
    
    return decodedFormula.toString();
  }
  
  DecodeResult decodeAtomsHelper(int i, String s) {
    int size = s.length;
    var decoded = <String, int>{};
    
    while (i < size) {
      var atom = "";
      var power = 0;
      
      if (s[i].codeUnitAt(0) >= 'A'.codeUnitAt(0) && s[i].codeUnitAt(0) <= 'Z'.codeUnitAt(0)) {
        atom += s[i];
        i++;
        
        while (i < size && s[i].codeUnitAt(0) >= 'a'.codeUnitAt(0) && s[i].codeUnitAt(0) <= 'z'.codeUnitAt(0)) {
          atom += s[i];
          i++;
        }
      }
      
      while (i < size && s[i].codeUnitAt(0) >= '0'.codeUnitAt(0) && s[i].codeUnitAt(0) <= '9'.codeUnitAt(0)) {
        power = power * 10 + int.parse(s[i]);
        i++;
      }
      
      if (atom.isNotEmpty) {
        if (power == 0) {
          decoded[atom] = (decoded[atom] ?? 0) + 1;
        } else {
          decoded[atom] = (decoded[atom] ?? 0) + power;
        }
      }
      
      power = 0;
      atom = "";
      
      if (i < size && s[i] == '(') {
        i++;
        var smallerResult = decodeAtomsHelper(i, s);
        var smallerDecoded = smallerResult.items1;
        i = smallerResult.items2;
        
        power = 0;
        while (i < size && s[i].codeUnitAt(0) >= '0'.codeUnitAt(0) && s[i].codeUnitAt(0) <= '9'.codeUnitAt(0)) {
          power = power * 10 + int.parse(s[i]);
          i++;
        }
        
        if (power == 0) {
          power = 1;
        }
        
        for (var entry in smallerDecoded.entries) {
          decoded[entry.key] = (decoded[entry.key] ?? 0) + entry.value * power;
        }
      }
      
      if (i < size && s[i] == ')') {
        i++;
        return DecodeResult(decoded, i);
      }
    }
    
    return DecodeResult(decoded, i);
  }
}

class DecodeResult {
  final Map<String, int> items1;
  final int items2;

  DecodeResult(this.items1, this.items2);
}
