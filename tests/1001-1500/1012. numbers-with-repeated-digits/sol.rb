# @param {Integer} n
# @return {Integer}
def num_dup_digits_at_most_n(n)
    digits = (n + 1).to_s.chars.map(&:to_i)
    nl = digits.length
    res = (0...nl - 1).sum { |i| 9 * (9 - i >= 0 ? (1..9).to_a.combination(i + 1).size * (1..i + 1).inject(:*) : 0) }
    
    # Reimplement perm logic manually
    perm = ->(n, k) { k < 0 || k > n ? 0 : (n - k + 1..n).inject(1, :*) }
    
    res = (0...nl - 1).sum { |i| 9 * perm.call(9, i) }
    s = Set.new
    digits.each_with_index do |x, i|
        start = i == 0 ? 1 : 0
        (start...x).each do |y|
            unless s.include?(y)
                res += perm.call(9 - i, nl - i - 1)
            end
        end
        break if s.include?(x)
        s.add(x)
    end
    n - res
end
