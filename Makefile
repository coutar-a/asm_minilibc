##
## Makefile for libasm in /home/ganesha/asm/tp1
##
## Made by Ambroise Coutarel
## Login   <ganesha@epitech.net>
##
## Started on  Fri Feb 27 13:30:26 2015 Ambroise Coutarel
## Last update Fri Mar 20 13:44:04 2015 Rémi DURAND
##

SRC	=	src/strlen@lib.S	\
		src/memcpy@lib.S	\
		src/memset@lib.S	\
		src/strcmp@lib.S	\
		src/memmove@lib.S	\
		src/rindex@lib.S	\
		src/strchr@lib.S	\
		src/strncmp@lib.S	\
		src/strpbrk@lib.S	\
		src/strstr@lib.S	\
		src/strcasecmp@lib.S	\
		src/strcspn@lib.S

OBJ	=	$(SRC:.S=.o)

LD	=	ld

NAME	=	libasm.so

all:		$(NAME)

%.o: %.S
	nasm -f elf64 -o $@ $<

#obj:
#		nasm -f elf64 $(SRC)

$(NAME): 	$(OBJ)
		$(LD)  -shared -fPIC -o $(NAME) $(OBJ)

clean:
		$(RM) $(OBJ)

fclean: 	clean
		$(RM) $(NAME)

re:		fclean all
