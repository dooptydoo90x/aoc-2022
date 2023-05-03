package main


prob1 :: proc() -> uint {
	input : []u8 = #load("input1.txt")

	start : int
	end : int
	sum : uint

	for char, i in input {
		if char == '\n' {
			end = i
			rucksack : []u8 = input[start:end]
			start = i+1
			dup : u8 = find_duplicate(rucksack)
			pri : u8 = eval_priority(dup)
			sum += uint(pri)
		}
	}
	return sum
}

find_duplicate :: proc(rucksack : []u8) -> u8 {
	left_mask : u64
	half := len(rucksack) / 2
	for char in rucksack[0:half] {
		left_mask = left_mask | bitmask(char)
	}
	for char in rucksack[half:] {
		mask : u64 = bitmask(char)
		if ((left_mask & mask) != 0) { return char }
	}

	return 0
}

bitmask :: proc(char : u8) -> u64 {
	return 1 << (eval_priority(char) - 1)
}

eval_priority :: proc(char : u8) -> u8 {
	priority : u8
	if char >= 'A' && char <= 'Z' { 
		priority = char - 38 
	} else if char >= 'a' && char <= 'z' { 
		priority = char - 96 
	} 
	
	return priority
}
