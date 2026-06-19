# @param {String} s
# @return {String}
def frequency_sort(s)
    freq = Hash.new(0)
    s.each_char { |c| freq[c] += 1 }
    freq.sort_by { |char, count| -count }.map { |char, count| char * count }.join
end
