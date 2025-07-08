class Solution {
    func maxEvents(_ events: [[Int]]) -> Int {
        let events = events.sorted { $0[0] < $1[0] } // sort by start day
        var minHeap = Heap<Int>(sort: <) // min-heap based on end day
        var day = 1
        var i = 0
        var attended = 0
        let n = events.count
        let lastDay = events.map { $0[1] }.max()!

        while day <= lastDay {
            // Add all events starting today
            while i < n && events[i][0] == day {
                minHeap.insert(events[i][1])
                i += 1
            }

            // Remove events that already expired
            while !minHeap.isEmpty && minHeap.peek()! < day {
                minHeap.remove()
            }

            // Attend the event that ends earliest
            if !minHeap.isEmpty {
                minHeap.remove()
                attended += 1
            }

            day += 1
        }

        return attended
    }
}

// Min Heap implementation
struct Heap<T> {
    var elements = [T]()
    let sort: (T, T) -> Bool

    init(sort: @escaping (T, T) -> Bool) {
        self.sort = sort
    }

    var isEmpty: Bool { elements.isEmpty }

    func peek() -> T? {
        return elements.first
    }

    mutating func insert(_ value: T) {
        elements.append(value)
        siftUp(elements.count - 1)
    }

    mutating func remove() -> T? {
        guard !elements.isEmpty else { return nil }
        if elements.count == 1 {
            return elements.removeLast()
        } else {
            let value = elements[0]
            elements[0] = elements.removeLast()
            siftDown(0)
            return value
        }
    }

    mutating func siftUp(_ index: Int) {
        var child = index
        var parent = (child - 1) / 2
        while child > 0 && sort(elements[child], elements[parent]) {
            elements.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }

    mutating func siftDown(_ index: Int) {
        var parent = index
        while true {
            let left = 2 * parent + 1
            let right = 2 * parent + 2
            var candidate = parent

            if left < elements.count && sort(elements[left], elements[candidate]) {
                candidate = left
            }
            if right < elements.count && sort(elements[right], elements[candidate]) {
                candidate = right
            }
            if candidate == parent { return }
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
}
