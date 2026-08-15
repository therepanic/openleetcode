# @param {String} text
# @param {String} broken_letters
# @return {Integer}
def can_be_typed_words(text, broken_letters)
    b = Array.new(26, false)
    res = 0

    broken_letters.each_char do |c|
        b[c.ord - 97] = true
    end

    text.split.each do |w|
        ok = true
        w.each_char do |c|
            if b[c.ord - 97]
                ok = false
                break
            end
        end
        res += 1 if ok
    end

    res
end
