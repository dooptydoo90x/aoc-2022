package main


prob1 :: proc() -> uint {
	input : []u8 : #load("input1.txt")	

	current_num : uint
	sum : uint
	max : uint 

	for char in input {
		if(char == '\n' && current_num == 0){
			if(sum > max) { max = sum }
			sum = 0
		} else if(char == '\n' && current_num > 0) {
			sum += current_num
			current_num = 0
		} else {
			current_num*=10
			current_num+=(uint(char) - 48)
		}
	}
	
	return max
}
