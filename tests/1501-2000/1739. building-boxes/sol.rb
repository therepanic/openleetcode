# @param {Integer} n
# @return {Integer}
def minimum_boxes(n)
    x = ((6*n)**(1.0/3.0)).to_i
    x += 1 while (x+1)*(x+2)*(x+3) <= 6*n
    x -= 1 while x*(x+1)*(x+2) > 6*n
    
    ans = x*(x+1)/2
    n -= x*(x+1)*(x+2)/6
    k = 1
    while n > 0
        ans += 1
        n -= k
        k += 1
    end
    ans
end
