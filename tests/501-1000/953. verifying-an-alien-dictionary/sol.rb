# @param {String[]} words
# @param {String} order
# @return {Boolean}
def is_alien_sorted(words, order)
    order_map = {}
    order.each_char.with_index { |char, i| order_map[char] = i }

    (0...words.length - 1).each do |i|
        w1 = words[i]
        w2 = words[i + 1]

        min_len = [w1.length, w2.length].min
        found_diff = false
        (0...min_len).each do |j|
            if w1[j] != w2[j]
                if order_map[w1[j]] > order_map[w2[j]]
                    return false
                end
                found_diff = true
                break
            end
        end

        if !found_diff && w1.length > w2.length
            return false
        end
    end

    true
end
