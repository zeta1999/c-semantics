/* Generated by CIL v. 1.3.7 */
/* print_CIL_Input is true */

extern  __attribute__((__nothrow__, __noreturn__)) void abort(void)  __attribute__((__leaf__)) ;
extern  __attribute__((__nothrow__, __noreturn__)) void exit(int __status )  __attribute__((__leaf__)) ;
long f(short a , short b ) 
{ 

  {
  return ((long )a / (long )b);
}
}
int main(void) 
{ long tmp ;

  {
  tmp = f((short)-32768, (short)-1);
  if (tmp != 32768L) {
    abort();
  } else {
    exit(0);
  }
}
}