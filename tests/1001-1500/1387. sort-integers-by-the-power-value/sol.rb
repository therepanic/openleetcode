# @param {Integer} lo
# @param {Integer} hi
# @param {Integer} k
# @return {Integer}
def get_kth(lo, hi, k)
    vc = []
    (lo..hi).each do |i|
        num = i
        count = 0
        while num != 1
            if num % 2 == 0
                num /= 2
            else
                num = 3 * num + 1
            end
            count += 1
        end
        vc << [i, count]
    end
    vc.sort_by! { |x| [x[1], x[0]] }
    vc[k - 1][0]
end
