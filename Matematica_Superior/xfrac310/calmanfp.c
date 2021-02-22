/* calmanfp.c
 * This file contains routines to replace calmanfp.asm.
 *
 * This file Copyright 1992 Ken Shirriff.  It may be used according to the
 * fractint license conditions, blah blah blah.
 */

#include "port.h"
#include "prototyp.h"
#include "fractype.h"

static int tmp_word, inside_color, periodicity_color;

void calcmandfpasmstart(void) {
    if (inside<0) {
	inside_color = maxit;
    } else {
	inside_color = inside;
    }

    if (periodicitycheck < 0) {
	periodicity_color = 7;
    } else {
	periodicity_color = inside_color;
    }
    oldcoloriter = 0;
}

#define ABS(x) ((x)>0?(x):-(x))
#define close 0.01

long calcmandfpasm(void) {
    int cx;
    int savedand;
    double x,y,x2, y2, xy, Cx, Cy, savedx, savedy;
    int savedincr;

    if (periodicitycheck==0 || periodicitycheck == -59) {
	oldcoloriter = 0;
    } else if (reset_periodicity==0) {
	oldcoloriter = maxit-250;
    }

    /* initparms */
    savedx = 0;
    savedy = 0;
    savedand = 1;
    savedincr = 1;
    orbit_ptr = 0;
    kbdcount--; /* Only check the keyboard sometimes */
    if (kbdcount<0) {
	int key;
	kbdcount = 1000;
	key = keypressed();
	if (key) {
	    if (key=='o' || key=='O') {
		getakey();
		show_orbit = 1-show_orbit;
	    } else {
		coloriter = -1;
		return -1;
	    }
	}
    }

    cx = maxit;

    if (fractype != JULIAFP && fractype != JULIA) {
	/* Mandelbrot_87 */
	cx--;
	Cx = init.x;
	Cy = init.y;
	x = parm.x+Cx;
	y = parm.y+Cy;
    } else {
	/* dojulia_87 */
	Cx = parm.x;
	Cy = parm.y;
	x = init.x;
	y = init.y;
    }
    x2 = x*x;
    y2 = y*y;
    xy = x*y;

    /* top_of_cs_loop_87 */
    do {
	x = x2-y2+Cx;
	y = 2*xy+Cy;
	if (outside<=-2) {
	    new.x = x;
	    new.y = y;
	}
	/* no_save_new_xy_87 */
	if (inside==-100) {
	    /* epsilon_cross */
	    if (ABS(x)<0.01) {
		realcoloriter = maxit-cx;
		if (realcoloriter==0) realcoloriter++;
		kbdcount -= realcoloriter;
		coloriter = GREEN;
		oldcoloriter = 0;
		goto pop_stack;
	    } else if (ABS(y)<0.01) {
		realcoloriter = maxit-cx;
		if (realcoloriter==0) realcoloriter++;
		kbdcount -= realcoloriter;
		coloriter = BROWN;
		oldcoloriter = 0;
		goto pop_stack;
	    }
	}
	/* end_epsilon_cross_87 */
	if (cx<oldcoloriter) {
	    if (savedand==0) {
		savedx = x;
		savedy = y;
		savedincr--;
		if (savedincr==0) {
		    savedand = (savedand<<1) + 1;
		    savedincr = 4;
		} else {
		    if (ABS(x-savedx)<closenuff && ABS(y-savedy)<closenuff) {
			oldcoloriter = 65535;
			realcoloriter = maxit;
			kbdcount = kbdcount-(maxit-cx);
			coloriter = periodicity_color;
			goto pop_stack;
		    }
		}
	    }
	}
	/* no_periodicity_check_87 */
	if (show_orbit != 0) {
	    plot_orbit(x,y,-1);
	}
	/* no_show_orbit_87 */
	x2 = x*x;
	y2 = y*y;
	xy = x*y;
	if (potflag != 0) {
	    magnitude = x2+y2;
	}
	if (x2+y2 > rqlim) {
	    goto over_bailout_87;
	}

	cx--;
    } while (cx>0);

    /* reached maxit */
    oldcoloriter = 65535;
    kbdcount -= maxit;
    realcoloriter = maxit;
    if (inside==-59) {
	coloriter = (x2+y2)*maxit/2+1;
    } else {
        coloriter = inside_color;
    }

pop_stack:
    
    if (orbit_ptr) {
	scrub_orbit();
    }

    return coloriter;

over_bailout_87:
    if (cx-10>=0) {
	oldcoloriter = cx-10;
    } else {
	oldcoloriter = 0;
    }
    coloriter = realcoloriter = maxit-cx;
    if (realcoloriter==0) realcoloriter = 1;
    kbdcount -= realcoloriter;
    if (outside==-1) {
    } else if (outside>-2) {
	coloriter = outside;
    } else {
	/* special_outside */
	int ax;
	if (outside==-2) {
	    coloriter += new.x + 7;
	} else if (outside==-3) {
	    coloriter += new.y + 7;
	} else if (outside==-4) {
	    if (new.y!=0) {
		coloriter *= new.x/new.y;
	    }
	} else if (outside==-5) {
	    coloriter +=  new.x + new.y;
	}
	/* check_color */
	if (coloriter<0 || coloriter>maxit) {
	    coloriter = 0;
	}
    }
    goto pop_stack;

}
