# @param {String} s
# @param {String[]} words
# @return {Integer}
def expressive_words(s, words)
    encode = ->(x) {
        chars = []
        cnts = []
        prev = nil
        c = 0
        x.each_char do |ch|
            if ch == prev
                c += 1
            else
                if prev != nil
                    chars << prev
                    cnts << c
                end
                prev = ch
                c = 1
            end
        end
        chars << prev
        cnts << c
        [chars, cnts]
    }
    
    s_chars, s_cnts = encode.call(s)
    ans = 0
    words.each do |w|
        w_chars, w_cnts = encode.call(w)
        next if w_chars != s_chars
        ok = true
        s_cnts.zip(w_cnts).each do |sc, wc|
            if sc < wc || (sc < 3 && sc != wc)
                ok = false
                break
            end
        end
        ans += 1 if ok
    end
    ans
end
