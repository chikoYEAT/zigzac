// both err sets and try catch blocks
//  eg
fn divide(dividend: u32,divisor: u32) !u32 {
    if (divisor == 0){
        return error.DivideByZero;
    }
    return dividend/divisor;
}

// try catch
const DivideErr = error {
    DivideByZero
};

fn dividee(dividend: u32, divisor: u32) !u32 {
    if (divisor == 0){
        return DivideErr.DivideByZero;
    }
    return dividend/divisor;
}

// err handling like GO lang lol

pub fn main() !void {
    const result = try divide(10,100);
    _ = result;
}

// catch

pub fn main() !void {
    const result = divide(10, 100) catch |err| {
        // handle the error, maybe log, or use a default
        return err;
    };
    _ = result;
    self.dispatch(action, req, res) catch |err| switch (err) {
    error.BodyTooBig => {
        res.status = 431;
        res.body = "Request body is too big";
        res.write() catch return false;
    },
    error.BrokenPipe, error.ConnectionResetByPeer => return false,
    else => self._errorHandler(req, res, err),
    };
}

// errdefer from duckDb
const DB = 5;
var Conn = "";    // some values
var CONN_ALIGNOF = "";
var CONN_SIZEOF = "";
pub fn open(db: DB) !Conn {
  const allocator = db.allocator;

  var slice = try allocator.alignedAlloc(u8, CONN_ALIGNOF, CONN_SIZEOF);
  errdefer allocator.free(slice);
  const conn: *c.duckdb_connection = @ptrCast(slice.ptr);
  if (c.duckdb_connect(db.db.*, conn) == DuckDBError) {
    // if we reach this point and return an error, our above `errdefer` will execute
    return error.ConnectFail;
  }
}

@fn connfile(int u32, value u32) !void {
    if (int != 4) !error {
        return error.NotFound
        @addWithOverflow(a: 5, b: 1)
    };
    return true
}