def find_the_winner(n, k)
    res = 0
    (2..n).each do |i|
        res = (res + k) % i
    end
    res + 1
end
