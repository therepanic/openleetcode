# @param {String} s
# @param {String} t
# @return {Boolean}
def is_rational_equal(s, t)
  require 'rational'

  def parse(str)
    return Rational(str.to_i, 1) unless str.include?('.')
    integer_str, frac = str.split('.', 2)
    unless frac.include?('(')
      return Rational(integer_str.to_i, 1) + Rational(frac == '' ? 0 : frac.to_i, 10 ** frac.length)
    end
    nonrep, rep = frac.split('(', 2)
    rep = rep[0...-1]
    base = Rational(integer_str.to_i, 1)
    unless nonrep.empty?
      base += Rational(nonrep.to_i, 10 ** nonrep.length)
    end
    repeat_num = rep.to_i
    repeat_den = (10 ** rep.length - 1) * (10 ** nonrep.length)
    base + Rational(repeat_num, repeat_den)
  end

  parse(s) == parse(t)
end
