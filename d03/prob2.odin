package main

// import "core:fmt"

prob2 :: proc() -> uint {
	input : []u8 = #load("input1.txt")

	start : int
	end : int
	sum : uint
	sacks : [3][]u8
	cur_sack := 0

	for char, i in input {
		if char == '\n' {
			end = i
			sacks[cur_sack] = input[start:end]
			start = i+1
			// fmt.printf("%i: %s\n", cur_sack, sacks[cur_sack])
			if cur_sack == 2 {
				badge : u8 = find_badge(sacks)
				pri : u8 = eval_priority(badge)
				sum += uint(pri)
				cur_sack = 0
				// fmt.printf("%c : %2i\n", badge, pri)
			} else { cur_sack+=1 }
		}
	}
	return sum
}

find_badge :: proc(sacks : [3][]u8) -> u8 {
	mask1, mask2 : u64
	for char in sacks[0] {
		mask1 = mask1 | bitmask(char)
	}
	for char in sacks[1] {
		mask2 = mask2 | bitmask(char)
	}
	mask1 = mask1 & mask2
	for char in sacks[2] {
		if mask1 & bitmask(char) != 0 { return char }
	}

	return 0
}

