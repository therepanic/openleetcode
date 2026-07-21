# @param {Integer} k
# @return {Integer}
def find_min_fibonacci_numbers(k)
    fib = [1, 1]
    while fib[-1] <= k
        fib.push(fib[-1] + fib[-2])
    end
    
    count = 0
    i = fib.length - 1
    
    while k > 0
        if fib[i] <= k
            k -= fib[i]
            count += 1
        end
        i -= 1
    end
    
    count
end
