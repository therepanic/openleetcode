func countOfAtoms(formula string) string {
    i := 0
    atomsFreq, _ := decodeAtomsHelper(&i, formula)
    
    sortedKeys := make([]string, 0, len(atomsFreq))
    for k := range atomsFreq {
        sortedKeys = append(sortedKeys, k)
    }
    sort.Strings(sortedKeys)
    
    decodedFormula := ""
    for _, key := range sortedKeys {
        decodedFormula += key
        if atomsFreq[key] > 1 {
            decodedFormula += strconv.Itoa(atomsFreq[key])
        }
    }
    
    return decodedFormula
}

func decodeAtomsHelper(i *int, s string) (map[string]int, int) {
    size := len(s)
    decoded := make(map[string]int)
    
    for *i < size {
        atom := ""
        power := 0
        
        if s[*i] >= 'A' && s[*i] <= 'Z' {
            atom += string(s[*i])
            *i++
            
            for *i < size && s[*i] >= 'a' && s[*i] <= 'z' {
                atom += string(s[*i])
                *i++
            }
        }
        
        for *i < size && s[*i] >= '0' && s[*i] <= '9' {
            power = power * 10 + int(s[*i] - '0')
            *i++
        }
        
        if len(atom) != 0 {
            if power == 0 {
                decoded[atom] = decoded[atom] + 1
            } else {
                decoded[atom] = decoded[atom] + power
            }
        }
        
        power = 0
        atom = ""
        
        if *i < size && s[*i] == '(' {
            *i++
            smallerDecoded, _ := decodeAtomsHelper(i, s)
            
            power = 0
            for *i < size && s[*i] >= '0' && s[*i] <= '9' {
                power = power * 10 + int(s[*i] - '0')
                *i++
            }
            
            if power == 0 {
                power = 1
            }
            
            for key, value := range smallerDecoded {
                decoded[key] = decoded[key] + value * power
            }
        }
        
        if *i < size && s[*i] == ')' {
            *i++
            return decoded, *i
        }
    }
    
    return decoded, *i
}
