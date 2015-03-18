/*
** test.c for test in /home/durand_u/github/asm_minilibc
** 
** Made by Rémi DURAND
** Login   <durand_u@epitech.net>
** 
** Started on  Tue Mar 17 10:37:37 2015 Rémi DURAND
** Last update Wed Mar 18 13:39:03 2015 Ambroise Coutarel
*/

#include <stdio.h>
#include <string.h>

int	main()
{
  char	*lol;
  char	*ret;

  lol = strdup("xddddm8");
  //printf("%d\n", strlen(lol)); // test strlen
  ret = strchr(lol, 'm');
  if (ret != NULL)
    printf("%s\n", ret);
  else
    printf("Fail\n");
  memset(lol, 'c', 7);
  printf("%s\n", lol);
}
