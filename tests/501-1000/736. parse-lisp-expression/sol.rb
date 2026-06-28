# @param {String} expression
# @return {Integer}
def evaluate(expression)
    def isnum(t)
        t[0] == '-' or t[0] =~ /[0-9]/
    end

    def lookup(v, env)
        env.reverse_each do |d|
            return d[v] if d.key?(v)
        end
        0
    end

    def toks(s)
        res = []
        i = 0
        n = s.length
        bal = 0
        st = 0
        while i < n
            c = s[i]
            if c == '('
                bal += 1
            elsif c == ')'
                bal -= 1
            elsif c == ' ' and bal == 0
                res << s[st...i] if st < i
                st = i + 1
            end
            i += 1
        end
        res << s[st...n] if st < n
        res
    end

    def evals(e, env)
        if e[0] != '('
            return e.to_i if isnum(e)
            return lookup(e, env)
        end
        inner = e[1...-1]
        parts = toks(inner)
        op = parts[0]
        if op == 'add'
            return evals(parts[1], env) + evals(parts[2], env)
        end
        if op == 'mult'
            return evals(parts[1], env) * evals(parts[2], env)
        end
        loc = {}
        env << loc
        i = 1
        while i < parts.length - 1
            v = parts[i]
            val = evals(parts[i+1], env)
            loc[v] = val
            i += 2
        end
        ans = evals(parts[-1], env)
        env.pop
        ans
    end

    evals(expression, [])
end
