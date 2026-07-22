# @param {String[]} words
# @param {Character[]} letters
# @param {Integer[]} score
# @return {Integer}
def max_score_words(words, letters, score)
    freq = Array.new(26, 0)
    letters.each do |c|
        c = c.to_s
        freq[c.ord - 'a'.ord] += 1
    end
    
    ans = [0]
    
    comb = lambda do |i, freq, total|
        if i == words.length
            ans[0] = [ans[0], total].max
            return
        end
        
        same = freq.dup
        rem = total
        full = true
        
        words[i].each_char do |ch|
            idx = ch.ord - 'a'.ord
            if freq[idx] == 0
                full = false
                break
            else
                freq[idx] -= 1
                total += score[idx]
            end
        end
        
        if full
            comb.call(i + 1, freq, total)
            comb.call(i + 1, same, rem)
        else
            comb.call(i + 1, same, rem)
        end
    end
    
    comb.call(0, freq, 0)
    ans[0]
end
