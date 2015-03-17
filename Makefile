##
## Makefile for libasm in /home/ganesha/asm/tp1
##
## Made by Ambroise Coutarel
## Login   <ganesha@epitech.net>
##
## Started on  Fri Feb 27 13:30:26 2015 Ambroise Coutarel
## Last update Tue Mar 17 11:28:05 2015 Rémi DURAND
##

SRC	=	src/strlen@lib.S

OBJ	=	src/strlen@lib.o

LD	=	ld

NAME	=	libasm.so

all:		$(NAME)

obj:
		nasm -f elf64 $(SRC)

$(NAME): 	obj
		$(LD)  -shared -fPIC -o $(NAME) $(OBJ)

clean:
		$(RM) $(OBJ)

fclean: 	clean
		$(RM) $(NAME)

re:		fclean all
