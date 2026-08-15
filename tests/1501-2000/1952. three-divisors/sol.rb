# @param {Integer} n
# @return {Boolean}
def is_three(n)
    count = 0
    (1..n).each do |i|
        count += 1 if n % i == 0
    end
    count == 3
end
