class Solution {
    func isRationalEqual(_ s: String, _ t: String) -> Bool {
        struct Fraction: Equatable {
            var num: Int
            var den: Int
        }

        func gcd(_ a: Int, _ b: Int) -> Int {
            var x = abs(a)
            var y = abs(b)
            while y != 0 {
                let tmp = x % y
                x = y
                y = tmp
            }
            return x
        }

        func pow10(_ n: Int) -> Int {
            var r = 1
            for _ in 0..<n { r *= 10 }
            return r
        }

        func norm(_ num: Int, _ den: Int) -> Fraction {
            let g = gcd(num, den)
            var n = num / g
            var d = den / g
            if d < 0 {
                n = -n
                d = -d
            }
            return Fraction(num: n, den: d)
        }

        func add(_ a: Fraction, _ b: Fraction) -> Fraction {
            norm(a.num * b.den + b.num * a.den, a.den * b.den)
        }

        func parse(_ x: String) -> Fraction {
            let dotParts = x.components(separatedBy: ".")
            if dotParts.count == 1 {
                return norm(Int(x)!, 1)
            }

            let integer = dotParts[0]
            let frac = dotParts[1]
            if let openIdx = frac.firstIndex(of: "(") {
                let nonrep = String(frac[..<openIdx])
                let rep = String(frac[frac.index(after: openIdx)..<frac.index(before: frac.endIndex)])
                var base = norm(Int(integer)!, 1)
                if !nonrep.isEmpty {
                    base = add(base, norm(Int(nonrep)!, pow10(nonrep.count)))
                }
                let repeatNum = Int(rep)!
                let repeatDen = (pow10(rep.count) - 1) * pow10(nonrep.count)
                return add(base, norm(repeatNum, repeatDen))
            } else {
                if frac.isEmpty {
                    return norm(Int(integer)!, 1)
                }
                return add(norm(Int(integer)!, 1), norm(Int(frac)!, pow10(frac.count)))
            }
        }

        return parse(s) == parse(t)
    }
}
