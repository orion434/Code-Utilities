rangeRescale  = function(x, a, b, c, d){
# Remap x from [a, b] into [c,d]    
xx <- c  +  (x-a) * (d-c)/(b-a)
return (xx)
}

origin = 1:10                        # Original data
y = rep(NA, length(origin))  # Output rescaled data  (initialise as empty or NaN with the same length as origin)
th = 2                                   # Threshold value
th_new = 6                           # Threshold in the remapped range

y[origin[origin<=th]]  <- lapply(origin[origin<=th], rangeRescale , 0, th, 0, th_new) # From [o, th] to [0,th_new]
y[origin[origin>th]]    <- lapply(origin[origin>th], rangeRescale , th, 10, th_new, 10) # From (th, 10] to (th_new,10]
y

####
# Alternative way (same function defined above)

origin = 1:10                        # Original data
y = rep(NA, length(origin))  # Output rescaled data  (initialise as empty or NaN with the same length as origin)
th = 2                                   # Threshold value
th_new = 6                           # Threshold in the remapped range

min_or = 0            # Minimum of original range
max_or = 10         # Max original range

min_remap  = 0    # Min remapped range
max_remap = 10  # Max remapped range

y[origin[origin<=th]]  <- lapply(origin[origin<=th], rangeRescale , min_or, th, min_remap, th_new) # From [o, th] to [0,th_new]
y[origin[origin>th]]    <- lapply(origin[origin>th], rangeRescale , th, max_or, th_new, max_remap) # From (th, 10] to (th_new,10]
y