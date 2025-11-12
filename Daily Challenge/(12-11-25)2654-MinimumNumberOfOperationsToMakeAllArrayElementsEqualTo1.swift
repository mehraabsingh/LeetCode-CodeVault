class Solution {
    func minOperations(_ nums: [Int]) -> Int {
        func gcd(_ a: Int, _ b: Int) -> Int {
            var x = a, y = b
            while y != 0 {
                let temp = x % y
                x = y
                y = temp
            }
            return x
        }
        
        let n = nums.count
        var ones = nums.filter { $0 == 1 }.count
        if ones > 0 { return n - ones }
        
        var minLen = Int.max
        for i in 0..<n {
            var g = nums[i]
            for j in i+1..<n {
                g = gcd(g, nums[j])
                if g == 1 {
                    minLen = min(minLen, j - i + 1)
                    break
                }
            }
        }
        
        return minLen == Int.max ? -1 : (n + minLen - 2)
    }
}
