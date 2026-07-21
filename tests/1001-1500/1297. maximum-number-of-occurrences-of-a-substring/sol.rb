# @param {String} s
# @param {Integer} max_letters
# @param {Integer} min_size
# @param {Integer} max_size
# @return {Integer}
def max_freq(s, max_letters, min_size, max_size)
    count = Hash.new(0)
    left = 0
    res = 0
    unique = Hash.new(0)
    (0...s.length).each do |right|
        unique[s[right]] += 1

        while unique.size > max_letters || right - left + 1 > min_size
            unique[s[left]] -= 1
            unique.delete(s[left]) if unique[s[left]] == 0
            left += 1
        end

        if right - left + 1 == min_size && unique.size <= max_letters
            curr = s[left..right]
            count[curr] += 1
            res = [res, count[curr]].max
        end
    end
    res
end
