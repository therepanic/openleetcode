# @param {String} expression
# @param {String[]} evalvars
# @param {Integer[]} evalints
# @return {String[]}
def basic_calculator_iv(expression, evalvars, evalints)
  evalmap = evalvars.zip(evalints).to_h

  tokens = []
  buf = ""
  expression.each_char do |ch|
    if ch.match?(/[a-zA-Z0-9]/)
      buf += ch
    else
      tokens << buf unless buf.empty?
      buf = ""
      tokens << ch if "+-*()".include?(ch)
    end
  end
  tokens << buf unless buf.empty?

  vals = []
  ops = []
  prec = {'+' => 1, '-' => 1, '*' => 2}

  apply_op = -> {
    op = ops.pop
    b = vals.pop
    a = vals.pop
    vals.push(case op
              when '+' then add(a, b)
              when '-' then sub(a, b)
              else mul(a, b)
              end)
  }

  tokens.each do |tok|
    if tok == '('
      ops.push(tok)
    elsif tok == ')'
      apply_op.call while ops.any? && ops.last != '('
      ops.pop
    elsif prec.key?(tok)
      while ops.any? && ops.last != '(' && prec[ops.last] >= prec[tok]
        apply_op.call
      end
      ops.push(tok)
    else
      vals.push(parse_token(tok, evalmap))
    end
  end
  apply_op.call while ops.any?
  poly = vals.last

  items = poly.reject { |_, v| v == 0 }
               .map { |k, v| [k.empty? ? [] : k.split(','), v] }
               .sort_by { |vars, _| [-vars.length, vars.join('*')] }

  items.map do |vars, coeff|
    if vars.empty?
      coeff.to_s
    else
      "#{coeff}*#{vars.join('*')}"
    end
  end
end

def make_key(vars)
  vars.sort.join(',')
end

def combine(poly)
  poly.select { |_, v| v != 0 }
end

def add(a, b)
  res = a.merge(b) { |_, v1, v2| v1 + v2 }
  combine(res)
end

def sub(a, b)
  res = a.dup
  b.each do |k, v|
    res[k] = res.fetch(k, 0) - v
  end
  combine(res)
end

def mul(a, b)
  res = Hash.new(0)
  a.each do |k1, v1|
    va = k1.empty? ? [] : k1.split(',')
    b.each do |k2, v2|
      vb = k2.empty? ? [] : k2.split(',')
      merged = va + vb
      key = make_key(merged)
      res[key] += v1 * v2
    end
  end
  combine(res)
end

def parse_token(tok, evalmap)
  res = {}
  if tok.match?(/^-?\d+$/)
    res[''] = tok.to_i
  elsif evalmap.key?(tok)
    res[''] = evalmap[tok]
  else
    res[tok] = 1
  end
  res
end
