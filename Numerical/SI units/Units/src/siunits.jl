struct SIUnit <: Number
  value::Real
  units::Vector{Real}
end

Base.convert(::Type{SIUnit}, x::Real) = SIUnit(x, [zero(x)])
Base.promote_rule(::Type{SIUnit}, ::Type{<:Real}) = SIUnit

Base.:+(x::SIUnit, y::SIUnit) = x.units == y.units ? SIUnit(x.value + y.value, x.units) : error("Incompatible dimensions")
Base.:-(x::SIUnit, y::SIUnit) = x.units == y.units ? SIUnit(x.value - y.value, x.units) : error("Incompatible dimensions")
Base.:-(x::SIUnit) = SIUnit(-x.value, x.units)

Base.:*(x::SIUnit, y::SIUnit) = let
  value = x.value * y.value
  units = x.units .+ y.units
  if iszero(units); return value; end
  SIUnit(value, units)
end

Base.:/(x::SIUnit, y::SIUnit) = let
  value = x.value / y.value
  units = x.units .- y.units
  if iszero(units); return value; end
  SIUnit(value, units)
end

# BASIC UNITS
const s   = SIUnit(1, [1,0,0,0,0,0,0])    # second
const m   = SIUnit(1, [0,1,0,0,0,0,0])    # meter
const kg  = SIUnit(1, [0,0,1,0,0,0,0])    # kilogram
const A   = SIUnit(1, [0,0,0,1,0,0,0])    # ampere
const K   = SIUnit(1, [0,0,0,0,1,0,0])    # kelvin
const mol = SIUnit(1, [0,0,0,0,0,1,0])    # mol
const cd  = SIUnit(1, [0,0,0,0,0,0,1])    # candela

# COMMON USED UNITS
# time
const hour = 3_600s # hour
const min = 60s     # minute
const ms = 1e-3s    # milisecond
const μs = 1e-6s    # microsecond
const ns = 1e-9s    # nanosecond

# lenght
const km = 1e+3m    # kilometer
const cm = 1e-2m    # centimeter
const mm = 1e-3m    # milimeter
const μm = 1e-6m    # micormeter
const nm = 1e-9m    # nanometer

# mass
const ton = 1e+3kg  # ton
const g = 1e-3kg    # gram
const mg = 1e-6kg   # miligram
const μg = 1e-6kg   # microgram

# electric current
const mA = 1e-3A    # miliampere

# temperature
const mK = 1e-3K    # milikelvin