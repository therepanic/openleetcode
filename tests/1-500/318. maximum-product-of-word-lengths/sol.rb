# @param {String[]} words
# @return {Integer}
def max_product(words)
    bitmasks = words.map { |w| w.chars.uniq.sum { |c| 1 << (c.ord - 'a'.ord) } }
    products = []
    (0...words.length).each do |i|
        (i+1...words.length).each do |j|
            if (bitmasks[i] & bitmasks[j]) == 0
                products << words[i].length * words[j].length
            end
        end
    end
    products.max || 0
end
