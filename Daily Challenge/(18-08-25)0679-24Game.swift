class Solution {
    func judgePoint24(_ cards: [Int]) -> Bool {
        var nums = cards.map { Double($0) }
        return dfs(nums)
    }
    
    private func dfs(_ nums: [Double]) -> Bool {
        // Base case: only one number left
        if nums.count == 1 {
            return abs(nums[0] - 24.0) < 1e-6
        }
        
        // Try all pairs of numbers
        for i in 0..<nums.count {
            for j in 0..<nums.count where i != j {
                // Pick nums[i] and nums[j], compute results
                var next = [Double]()
                for k in 0..<nums.count where k != i && k != j {
                    next.append(nums[k])
                }
                
                // Try 4 operations
                for result in compute(nums[i], nums[j]) {
                    next.append(result)
                    if dfs(next) {
                        return true
                    }
                    next.removeLast()
                }
            }
        }
        return false
    }
    
    private func compute(_ a: Double, _ b: Double) -> [Double] {
        var results = [a + b, a - b, b - a, a * b]
        if abs(b) > 1e-6 {
            results.append(a / b)
        }
        if abs(a) > 1e-6 {
            results.append(b / a)
        }
        return results
    }
}
