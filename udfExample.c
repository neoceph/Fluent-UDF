/***********************************************************************
udfexample.c
UDF for specifying steady-state velocity profile boundary condition
************************************************************************/
#include "udf.h"
DEFINE_PROFILE(inlet_x_velocity, thread, position)
{
    real x[ND_ND]; /* this will hold the position vector */
    real y, h;
    face_t f;
    h = 0.016; /* inlet height in m */
    begin_f_loop(f, thread)
    {
        F_CENTROID(x, f, thread);
        y = 2. * (x[1] - 0.5 * h) / h; /* non-dimensional y coordinate */
        F_PROFILE(f, thread, position) = 0.1 * (1.0 - y * y);
    }
    end_f_loop(f, thread)
}