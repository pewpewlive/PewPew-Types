-- Auto-generated type definitions from ppl-docs (https://github.com/pewpewlive/ppl-docs)
---@meta

fmath = {}

--- Returns the maximum value a fixedpoint integer can take.
---@return fixedpoint
function fmath.max_fixedpoint() end

--- Returns a random fixedpoint value in the range [`min`, `max`]. `max` must be greater or equal to `min`.
---@param min fixedpoint
---@param max fixedpoint
---@return fixedpoint
function fmath.random_fixedpoint(min, max) end

--- Returns an integer in the range [`min`, `max`]. `max` must be greater or equal to `min`.
---@param min any
---@param max any
---@return any
function fmath.random_int(min, max) end

--- Returns the square root of `x`. `x` must be greater or equal to 0.
---@param x fixedpoint
---@return fixedpoint
function fmath.sqrt(x) end

--- Returns the fixedpoint value representing the fraction `numerator`/`denominator`. `denominator` must not be equal to zero.
---@param numerator integer
---@param denominator integer
---@return fixedpoint
function fmath.from_fraction(numerator, denominator) end

--- Returns the integral part of the `value`.
---@param value fixedpoint
---@return any
function fmath.to_int(value) end

--- Returns the absolute value.
---@param value fixedpoint
---@return fixedpoint
function fmath.abs_fixedpoint(value) end

--- Returns a fixedpoint value with the integral part of `value`, and no fractional part.
---@param value any
---@return fixedpoint
function fmath.to_fixedpoint(value) end

--- Returns the sinus and cosinus of `angle`. `angle` is in radian.
---@param angle fixedpoint
---@return fixedpoint
---@return fixedpoint
function fmath.sincos(angle) end

--- Returns the principal value of the arc tangent of y/x. Returns a value in the range [0, 2π[.
---@param y fixedpoint
---@param x fixedpoint
---@return fixedpoint
function fmath.atan2(y, x) end

--- Returns τ (aka 2π).
---@return fixedpoint
function fmath.tau() end


