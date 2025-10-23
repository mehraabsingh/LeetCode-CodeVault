class Solution {
    func hasSameDigits(_ s: String) -> Bool {
        var digits = s.map { Int(String($0))! }
        while digits.count > 2 {
            var next = [Int]()
            for i in 0..<digits.count - 1 {
                next.append((digits[i] + digits[i + 1]) % 10)
            }
            digits = next
        }
        return digits[0] == digits[1]
    }
}
