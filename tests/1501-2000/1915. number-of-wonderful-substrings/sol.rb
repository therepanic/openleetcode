# @param {String} word

# @return {Integer}

def wonderful_substrings(word)

    count = Hash.new(0)

    count[0] = 1

    mask = 0

    res = 0

    word.each_char do |ch|

        bit = ch.ord - 'a'.ord

        mask ^= 1 << bit

        res += count[mask]

        (0...10).each do |i|

            res += count[mask ^ (1 << i)]

        end

        count[mask] += 1

    end

    res

end
