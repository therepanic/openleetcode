class Solution {
    func countOfAtoms(_ formula: String) -> String {
        var i = 0
        let atomsFreq = decodeAtomsHelper(&i, Array(formula))
        
        let sortedKeys = atomsFreq.keys.sorted()
        var decodedFormula = ""
        
        for key in sortedKeys {
            decodedFormula += key
            if atomsFreq[key]! > 1 {
                decodedFormula += String(atomsFreq[key]!)
            }
        }
        
        return decodedFormula
    }
    
    private func decodeAtomsHelper(_ i: inout Int, _ s: [Character]) -> [String: Int] {
        let size = s.count
        var decoded = [String: Int]()
        
        while i < size {
            var atom = ""
            var power = 0
            
            if s[i] >= "A" && s[i] <= "Z" {
                atom += String(s[i])
                i += 1
                
                while i < size && s[i] >= "a" && s[i] <= "z" {
                    atom += String(s[i])
                    i += 1
                }
            }
            
            while i < size && s[i] >= "0" && s[i] <= "9" {
                power = power * 10 + Int(String(s[i]))!
                i += 1
            }
            
            if !atom.isEmpty {
                if power == 0 {
                    decoded[atom] = (decoded[atom] ?? 0) + 1
                } else {
                    decoded[atom] = (decoded[atom] ?? 0) + power
                }
            }
            
            power = 0
            atom = ""
            
            if i < size && s[i] == "(" {
                i += 1
                let smallerDecoded = decodeAtomsHelper(&i, s)
                
                power = 0
                while i < size && s[i] >= "0" && s[i] <= "9" {
                    power = power * 10 + Int(String(s[i]))!
                    i += 1
                }
                
                if power == 0 {
                    power = 1
                }
                
                for (key, value) in smallerDecoded {
                    decoded[key] = (decoded[key] ?? 0) + value * power
                }
            }
            
            if i < size && s[i] == ")" {
                i += 1
                return decoded
            }
        }
        
        return decoded
    }
}
