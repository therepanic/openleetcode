# @param {String} word
# @return {Integer}
def num_different_integers(word)
    i = 0
    n = word.length
    st = Set.new
    while i < n
        while i < n && word[i] =~ /[a-zA-Z]/
            i += 1
        end
        temp_int = ""
        while i < n && word[i] =~ /[0-9]/
            temp_int += word[i]
            i += 1
        end
        j = 0
        while j + 1 < temp_int.length && temp_int[j] == '0'
            j += 1
        end
        k = temp_int[j..-1]
        if k != ""
            st.add(k)
        end
    end
    st.length
end
