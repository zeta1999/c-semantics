/* Generated by CIL v. 1.3.7 */
/* print_CIL_Input is true */

extern  __attribute__((__nothrow__, __noreturn__)) void abort(void)  __attribute__((__leaf__)) ;
int x  ;
int ( __attribute__((__noinline__)) foo)(void) 
{ 

  {
  x = - x;
  return (0);
}
}
int ( __attribute__((__noinline__)) bar)(void)  __attribute__((__const__)) ;
int ( __attribute__((__noinline__)) bar)(void) 
{ 

  {
  return (0);
}
}
int ( __attribute__((__noinline__)) test)(int c ) 
{ int tmp ;
  int res ;
  int ( __attribute__((__noinline__)) (*tmp___0))(void) ;
  int tmp___1 ;

  {
  tmp = x;
  if (c) {
    tmp___0 = & foo;
  } else {
    tmp___0 = & bar;
  }
  tmp___1 = (*tmp___0)();
  res = tmp___1;
  return ((tmp + x) + res);
}
}
int main(void) 
{ int tmp ;

  {
  x = 1;
  tmp = test(1);
  if (tmp != 0) {
    abort();
  }
  return (0);
}
}