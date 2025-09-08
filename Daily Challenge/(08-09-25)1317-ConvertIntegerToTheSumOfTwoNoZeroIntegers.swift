class Solution {
    func getNoZeroIntegers(_ n: Int) -> [Int] {
        for a in 1..<n {
            let b = n - a
            if isNoZero(a) && isNoZero(b) {
                return [a, b]
            }
        }
        return []
    }
    
    private func isNoZero(_ num: Int) -> Bool {
        var x = num
        while x > 0 {
            if x % 10 == 0 {
                return false
            }
            x /= 10
        }
        return true
    }
}
