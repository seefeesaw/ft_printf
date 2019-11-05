# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ashongwe <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/08/22 17:48:29 by ashongwe          #+#    #+#              #
#    Updated: 2019/08/22 17:50:08 by ashongwe         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #



NAME = libftprintf.a

FT = ft_printf unicode_convert converter flags_getter padding parser conv_setter \
	 u_conveter

LIB = libft/libft.a

SRC = srcs/
INC = includes/
LIBPATH = libft/
OBJ = objects/

FLAGS = -Wall -Werror -Wextra

FT_C = $(patsubst %,$(SRC)%.c,$(FT))
FT_O = $(patsubst %,%.o,$(FT))
FT_O_OBJ = $(patsubst %,$(OBJ)%.o,$(FT))

.PHONY: all clean fclean re

all: $(NAME)

$(LIB):
	make -C $(LIBPATH) all
	cp $(LIB) $(NAME)

$(FT_O_OBJ): $(LIB)
	gcc -I $(INC) $(FLAGS) -c $(FT_C)
	mkdir $(OBJ) 2> /dev/null || true
	mv $(FT_O) $(OBJ)

$(NAME): $(FT_O_OBJ)
	ar rc $(NAME) $(FT_O_OBJ)
	ranlib $(NAME)

clean:
	make -C $(LIBPATH) clean
	/bin/rm -rf $(OBJ)

fclean: clean
	/bin/rm -f $(LIB)
	/bin/rm -f $(NAME)

re: fclean all
