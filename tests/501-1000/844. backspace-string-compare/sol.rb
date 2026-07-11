# @param {String} s
# @param {String} t
# @return {Boolean}
def backspace_compare(s, t)
    def get_next_valid_char_index(str, last)
        backspace_count = 0
        while last >= 0
            if str[last] == '#'
                backspace_count += 1
            elsif backspace_count > 0
                backspace_count -= 1
            else
                break
            end
            last -= 1
        end
        last
    end

    ps = s.length - 1
    pt = t.length - 1

    while ps >= 0 || pt >= 0
        ps = get_next_valid_char_index(s, ps)
        pt = get_next_valid_char_index(t, pt)

        if ps < 0 && pt < 0
            return true
        end
        if ps < 0 || pt < 0
            return false
        elsif s[ps] != t[pt]
            return false
        end

        ps -= 1
        pt -= 1
    end

    true
end
