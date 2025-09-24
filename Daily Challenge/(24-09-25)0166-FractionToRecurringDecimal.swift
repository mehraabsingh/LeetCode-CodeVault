class Solution {
    func fractionToDecimal(_ numerator: Int, _ denominator: Int) -> String {
        if numerator == 0 { return "0" }
        var result = ""
        if (numerator < 0) != (denominator < 0) { result += "-" }
        let num = abs(Int64(numerator))
        let den = abs(Int64(denominator))
        result += String(num / den)
        var remainder = num % den
        if remainder == 0 { return result }
        result += "."
        var map = [Int64: Int]()
        while remainder != 0 {
            if let index = map[remainder] {
                let start = result.index(result.startIndex, offsetBy: index)
                result.insert("(", at: start)
                result.append(")")
                break
            }
            map[remainder] = result.count
            remainder *= 10
            result += String(remainder / den)
            remainder %= den
        }
        return result
    }
}
