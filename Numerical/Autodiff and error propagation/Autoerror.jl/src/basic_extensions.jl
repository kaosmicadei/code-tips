Base.sqrt(f::Dual) = Dual(sqrt(f.val), f.grad ./ sqrt(f.val))
Base.log(f::Dual) = Dual(log(f.val), f.grad ./ f.val)
Base.conj(f::Dual) = Dual(conj(f.val), conj.(f.grad))