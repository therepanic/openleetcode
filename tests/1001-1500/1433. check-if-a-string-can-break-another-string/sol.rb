# @param {String} s1
# @param {String} s2
# @return {Boolean}
def check_if_can_break(s1, s2)
    freq = Array.new(26, 0)
    n = s1.length

    s1.each_char do |ch|
        freq[ch.ord - 'a'.ord] += 1
    end

    temp1 = []

    25.downto(0) do |i|
        while freq[i] > 0
            temp1 << ('a'.ord + i).chr
            freq[i] -= 1
        end
    end

    freq = Array.new(26, 0)

    s2.each_char do |ch|
        freq[ch.ord - 'a'.ord] += 1
    end

    temp2 = []

    25.downto(0) do |i|
        while freq[i] > 0
            temp2 << ('a'.ord + i).chr
            freq[i] -= 1
        end
    end

    s1 = temp1.join
    s2 = temp2.join

    return true if (0...n).all? { |i| s1[i] >= s2[i] }
    return true if (0...n).all? { |i| s2[i] >= s1[i] }
    
    false
end
