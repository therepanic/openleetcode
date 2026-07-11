# @param {String[]} digits
# @param {Integer} n
# @return {Integer}
def at_most_n_given_digit_set(digits, n)
    d = digits.length
    s = n.to_s
    k = s.length

    pow = ->(base, exp) { (0...exp).reduce(1) { |acc, _| acc * base } }
    ans = 0

    (1...k).each do |len|
        ans += pow.call(d, len)
    end

    s.each_char.with_index do |ch, i|
        cnt = digits.count { |digit| digit < ch }
        ans += cnt * pow.call(d, k - i - 1)
        return ans unless digits.include?(ch)
        ans += 1 if i == k - 1
    end

    ans
end
