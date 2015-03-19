/*
** test.c for test in /home/durand_u/github/asm_minilibc
** 
** Made by Rémi DURAND
** Login   <durand_u@epitech.net>
** 
** Started on  Tue Mar 17 10:37:37 2015 Rémi DURAND
** Last update Thu Mar 19 15:59:16 2015 Ambroise Coutarel
*/

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int	main()
{
  char	*lol;
  char	*ret;
  char	*louwl;

  lol = strdup("xddddm8");
  louwl = strdup("koujouk");
  printf("%lu\n", strlen(lol)); // test strlen
  ret = strchr(lol, 'm');
  if (ret != NULL)
    printf("%s\n", ret);
  else
    printf("Fail\n");
  memset(lol, 'c', 7);
  printf("%s\n", lol);
  memcpy(lol, louwl, strlen(louwl));
  printf("%s\n", lol);
  printf("\nstrcmp :\n%d\n", strcmp(lol, "koujouk"));
  printf("%d\n", strcmp(lol, "koujouk0"));
  printf("%d\n\n", strcmp(lol, "xddddm8"));
  printf("strncmp : \n");
  printf("%d\n", strncmp(lol, "koujouk", 12));
  printf("memmove : \n");
  memmove(lol, lol, strlen(lol));
  printf("%s\n", lol);
  printf("rindex : \n");
  printf("%s\n", rindex(lol, 'j'));
  /*free(lol);
  free(louwl);
  lol = strdup("012");
  louwl = strdup("052");
  printf("%d\n", strncmp(lol, louwl, 4));
  printf("%d\n", strncmp(lol, louwl, 1));
  free(lol);
  free(louwl);
  lol = strdup("0123");
  louwl = strdup("012");
  printf("%d\n", strncmp(lol, louwl, 4));
  printf("%d\n", strncmp(lol, louwl, 3));*/
  free(lol);
  free(louwl);
}
