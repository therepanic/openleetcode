# @param {String} s
# @return {Integer}
def max_product(s)
    n = s.length
    palin_masks = []

    is_palindrome = lambda do |mask|
        seq = []
        (0...n).each do |i|
            if (mask >> i) & 1 == 1
                seq << s[i]
            end
        end
        seq == seq.reverse
    end

    (1... (1 << n)).each do |mask|
        if is_palindrome.call(mask)
            palin_masks << [mask, mask.to_s(2).count("1")]
        end
    end

    max_product = 0
    (0...palin_masks.length).each do |i|
        (i+1...palin_masks.length).each do |j|
            m1, l1 = palin_masks[i]
            m2, l2 = palin_masks[j]
            if (m1 & m2) == 0
                max_product = [max_product, l1 * l2].max
            end
        end
    end

    max_product
end
