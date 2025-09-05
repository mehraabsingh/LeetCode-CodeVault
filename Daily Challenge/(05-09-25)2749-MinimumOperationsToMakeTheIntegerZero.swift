class Solution {
    func makeTheIntegerZero(_ num1: Int, _ num2: Int) -> Int {
        for k in 1...100 {  // limit ~100 since 2^60 > 1e18
            let S = num1 - k * num2
            if S < 0 { continue }
            
            let bits = S.nonzeroBitCount  // popcount in Swift
            if bits <= k && k <= S {
                return k
            }
        }
        return -1
    }
}
