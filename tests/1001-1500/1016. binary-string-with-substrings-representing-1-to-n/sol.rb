# @param {String} s
# @param {Integer} n
# @return {Boolean}
def query_string(s, n)
    n.downto(1) do |num|
        target = num.to_s(2)
        length = target.length
        left = 0
        valid = false
        (0...s.length).each do |right|
            while right - left + 1 > length
                left += 1
            end
            if s[left..right] == target
                valid = true
                break
            end
        end
        return false unless valid
    end
    true
end
