# @param {String} expression
# @return {Integer}
def min_operations_to_flip(expression)
    n = expression.length
    loc = {}
    stack = []
    (n-1).downto(0) do |i|
        if expression[i] == ")"
            stack << i
        elsif expression[i] == "("
            loc[stack.pop] = i
        end
    end
    
    fn = lambda do |lo, hi|
        if lo == hi
            return expression[lo].to_i, 1
        end
        if expression[hi] == ")" && loc[hi] == lo
            return fn.call(lo+1, hi-1)
        end
        mid = (loc[hi] || hi) - 1
        v, c = fn.call(mid+1, hi)
        vv, cc = fn.call(lo, mid-1)
        if expression[mid] == "|"
            val = v | vv
            if v == 0 && vv == 0
                chg = [c, cc].min
            elsif v == 1 && vv == 1
                chg = 1 + [c, cc].min
            else
                chg = 1
            end
        else
            val = v & vv
            if v == 0 && vv == 0
                chg = 1 + [c, cc].min
            elsif v == 1 && vv == 1
                chg = [c, cc].min
            else
                chg = 1
            end
        end
        [val, chg]
    end
    
    fn.call(0, n-1)[1]
end
