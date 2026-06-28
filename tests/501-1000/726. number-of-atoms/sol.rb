# @param {String} formula
# @return {String}
def count_of_atoms(formula)
    atoms_freq = {}
    i = 0
    atoms_freq, i = decode_atoms_helper(i, formula)
    
    sorted_keys = atoms_freq.keys.sort
    decoded_formula = ""
    sorted_keys.each do |key|
        value = atoms_freq[key]
        if value == 1
            decoded_formula += key
        else
            decoded_formula += key + value.to_s
        end
    end
    decoded_formula
end

def decode_atoms_helper(i, s)
    size = s.length
    decoded = {}

    while i < size
        atom = ""
        power = 0

        if s[i] >= 'A' && s[i] <= 'Z'
            atom += s[i]
            i += 1
            while i < size && s[i] >= 'a' && s[i] <= 'z'
                atom += s[i]
                i += 1
            end
        end

        while i < size && s[i] >= '0' && s[i] <= '9'
            power = power * 10 + s[i].to_i
            i += 1
        end

        if atom.length != 0
            if power == 0
                decoded[atom] = (decoded[atom] || 0) + 1
            else
                decoded[atom] = (decoded[atom] || 0) + power
            end
        end

        power = 0
        atom = ""

        if i < size && s[i] == '('
            smaller_decoded = {}
            smaller_decoded, i = decode_atoms_helper(i + 1, s)

            power = 0
            while i < size && s[i] >= '0' && s[i] <= '9'
                power = power * 10 + s[i].to_i
                i += 1
            end

            power = 1 if power == 0

            smaller_decoded.each do |key, value|
                decoded[key] = (decoded[key] || 0) + value * power
            end
        end

        if i < size && s[i] == ')'
            return decoded, i + 1
        end
    end

    return decoded, i
end
