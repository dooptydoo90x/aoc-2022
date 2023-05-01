package main

prob1 :: proc () -> uint {
	input : []u8 : #load("input1.txt")

	hand :: struct {
		loses : ^hand,
		beats : ^hand,
	}

	R, P, S : hand
	R = {loses = &P, beats = &S}
	P = {loses = &S, beats = &R}
	S = {loses = &R, beats = &P}

	sum : uint
	mine : ^hand
	theirs : ^hand

	for char in input {
		if char == '\n' {
			switch theirs {
				case mine : sum+=3
				case mine.beats : sum+=6
			}
		} else if char == ' ' {
			continue
		} else {
			switch char {
				case 'A' : theirs = &R
				case 'B' : theirs = &P
				case 'C' : theirs = &S
				case 'X' : 
					mine = &R
					sum+=1
				case 'Y' : 
					mine = &P
					sum+=2
				case 'Z' : 
					mine = &S
					sum+=3
			}
		}
	}

	return sum
}
