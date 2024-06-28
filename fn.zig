const expect = @import("std").testing.expect;
const std = @import("std");

fn addFive(x: u32) u32 {
    return x + 5;
}

test "function" {
    const y = addFive(0);
    try expect(@TypeOf(y) == u32);
    try expect(y == 5);
}

fn fibonacci(n: u16) u16 {
    if (n == 0 or n == 1) return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
    
}

test "function recursion" {
    const x = fibonacci(10);
    std.debug.print("{d}\n",.{x});               // till 55
    try expect(x == 55);
    
}

test "out of bounds, no safety" {
    @setRuntimeSafety(false);
    const a = [3]u8{ 1, 2, 3 };
    const index: u8 = 5;
    const b = a[index];
    _ = b;
}

fn increment(num: *u8) void {
    num.* += 1;
}

test "pointers" {
    var x: u8 = 1;
    increment(&x);
    try expect(x == 2);
    std.debug.print("{d}\n",.{x});
}

test "slices 2" {
    const array = [_]u8{ 1, 2, 3, 4, 5 };
    const slice = array[0..3];
    try expect(@TypeOf(slice) == *const [3]u8);
    std.debug.print("{d}\n",.{slice});
}

const Suit = enum {
    clubs,
    spades,
    diamonds,
    hearts,
    pub fn isClubs(self: Suit) bool {
        return self == Suit.clubs;
    }
};

test "enum method" {
    try expect(Suit.spades.isClubs() == Suit.isClubs(.spades));
}



const Mode = enum {
    var count: u32 = 0;
    on,
    off,
};

test "hmm" {
    std.debug.print("{d}\n",.{Mode.count});
    Mode.count += 1;
    try expect(Mode.count == 1);
    std.debug.print("{d}\n",.{Mode.count});
}