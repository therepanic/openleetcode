# @param {String} s
# @return {Boolean}
def are_occurrences_equal(s)
    d = Hash.new(0)
    s.each_char { |c| d[c] += 1 }
    d.values.uniq.length == 1
end
