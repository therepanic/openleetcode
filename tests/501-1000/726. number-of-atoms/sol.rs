impl Solution {
    pub fn count_of_atoms(formula: String) -> String {
        let mut i = 0;
        let atoms_freq = Self::decode_atoms_helper(&mut i, &formula);
        
        let mut sorted_keys: Vec<&String> = atoms_freq.keys().collect();
        sorted_keys.sort();
        
        let mut decoded_formula = String::new();
        for key in sorted_keys {
            decoded_formula.push_str(key);
            let value = atoms_freq[key];
            if value > 1 {
                decoded_formula.push_str(&value.to_string());
            }
        }
        
        decoded_formula
    }
    
    fn decode_atoms_helper(i: &mut usize, s: &str) -> std::collections::HashMap<String, i32> {
        let size = s.len();
        let mut decoded = std::collections::HashMap::new();
        let chars: Vec<char> = s.chars().collect();
        
        while *i < size {
            let mut atom = String::new();
            let mut power = 0;
            
            if chars[*i] >= 'A' && chars[*i] <= 'Z' {
                atom.push(chars[*i]);
                *i += 1;
                
                while *i < size && chars[*i] >= 'a' && chars[*i] <= 'z' {
                    atom.push(chars[*i]);
                    *i += 1;
                }
            }
            
            while *i < size && chars[*i] >= '0' && chars[*i] <= '9' {
                power = power * 10 + (chars[*i] as i32 - '0' as i32);
                *i += 1;
            }
            
            if !atom.is_empty() {
                if power == 0 {
                    *decoded.entry(atom).or_insert(0) += 1;
                } else {
                    *decoded.entry(atom).or_insert(0) += power;
                }
            }
            
            power = 0;
            atom = String::new();
            
            if *i < size && chars[*i] == '(' {
                *i += 1;
                let smaller_decoded = Self::decode_atoms_helper(i, s);
                
                power = 0;
                while *i < size && chars[*i] >= '0' && chars[*i] <= '9' {
                    power = power * 10 + (chars[*i] as i32 - '0' as i32);
                    *i += 1;
                }
                
                if power == 0 {
                    power = 1;
                }
                
                for (key, value) in smaller_decoded {
                    *decoded.entry(key).or_insert(0) += value * power;
                }
            }
            
            if *i < size && chars[*i] == ')' {
                *i += 1;
                return decoded;
            }
        }
        
        decoded
    }
}
