# @param {Integer} n
# @return {Integer}
def tribonacci(n)
    ft, st, tt = 0, 1, 1
    (1..n).each do |i|
        frt = ft + st + tt
        ft = st
        st = tt
        tt = frt
    end
    ft
end
