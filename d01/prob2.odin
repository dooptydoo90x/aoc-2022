package main


prob2 :: proc() -> uint {
	input : []u8 : #load("input1.txt")	

	current_num : uint
	sum : uint
	top : [3]uint 

	for char in input {
		if char == '\n' && current_num == 0 {
			min : int
			for t, index in top {
				if t < top[min] { min = index }
			}
			if sum > top[min] { top[min] = sum }
			sum = 0
		} else if char == '\n' {
			sum += current_num
			current_num = 0
		} else {
			current_num*=10
			current_num+=(uint(char) - 48)
		}
	}
	
	return top[0] + top[1] + top[2]
}
