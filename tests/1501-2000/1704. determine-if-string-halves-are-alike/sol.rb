# @param {String} s
# @return {Boolean}
def halves_are_alike(s)
    vowels = 'aeiouAEIOU'
    mid = s.length / 2
    count = 0
    (0...mid).each do |i|
        count += 1 if vowels.include?(s[i])
    end
    (mid...s.length).each do |i|
        count -= 1 if vowels.include?(s[i])
    end
    count == 0
end
