# @param {Integer} n
# @return {Integer}
def count_triples(n)
    cnt = 0
    nsqrt = Math.sqrt(n).to_i
    (2..nsqrt).each do |s|
        start_t = (s & 1) + 1
        (start_t...s).step(2).each do |t|
            a, b = s, t
            while b != 0
                a, b = b, a % b
            end
            next if a != 1
            c = s * s + t * t
            break if c > n
            k = n / c
            cnt += 2 * k
        end
    end
    cnt
end
