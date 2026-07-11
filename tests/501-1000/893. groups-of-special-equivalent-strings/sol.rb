# @param {String[]} words
# @return {Integer}
def num_special_equiv_groups(words)
    seen = Set.new
    words.each do |w|
        even = w.chars.select.each_with_index { |_, i| i.even? }.sort.join
        odd = w.chars.select.each_with_index { |_, i| i.odd? }.sort.join
        seen.add([even, odd])
    end
    seen.size
end
