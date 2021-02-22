#include <stdio.h>
main()
{
    short x = 3*256 + 2;
    short y;
    unsigned char *c;
    printf("int is %d\n",x);
    printf("least signficant byte %d\n",x&255);
    printf("most significant byte %d\n",x>>8);
    c = (unsigned char *)&x;
    y = *c;
    printf("low byte %u\n",y);
    c++;
    y = *c;
    printf("hi  byte %u\n",y);
}
