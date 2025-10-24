class Solution {
    func nextBeautifulNumber(_ n: Int) -> Int {
        var num = n
        repeat {
            num += 1
        } while !isBalance(num)
        return num
    }

    private func isBalance(_ num: Int) -> Bool {
        var num = num
        var count = Array(repeating: 0, count: 10)
        while num > 0 {
            let digit = num % 10
            if digit == 0 { return false }
            count[digit] += 1
            num /= 10
        }
        for i in 1..<10 {
            if count[i] > 0 && count[i] != i {
                return false
            }
        }
        return true
    }
}
