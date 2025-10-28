class Solution {
    func countValidSelections(_ nums: [Int]) -> Int {
        func canMakeZero(_ arr: [Int], _ start: Int, _ dir: Int) -> Bool {
            var nums = arr
            var i = start
            var d = dir
            while i >= 0 && i < nums.count {
                if nums[i] == 0 {
                    i += d
                } else {
                    nums[i] -= 1
                    d = -d
                    i += d
                }
            }
            return nums.allSatisfy { $0 == 0 }
        }
        
        var res = 0
        for i in 0..<nums.count where nums[i] == 0 {
            if canMakeZero(nums, i, 1) { res += 1 }
            if canMakeZero(nums, i, -1) { res += 1 }
        }
        return res
    }
}
