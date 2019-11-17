# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: nschat <nschat@student.codam.nl>             +#+                      #
#                                                    +#+                       #
#    Created: 2019/10/29 17:30:18 by nschat        #+#    #+#                  #
#    Updated: 2019/11/17 21:50:34 by nschat        ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

CC = gcc
CFLAGS = -Wall -Wextra -Werror -I .
ifeq (${DEBUG},true)
	CFLAGS := -g -fprofile-instr-generate -fcoverage-mapping $(CFLAGS)
endif

SRC = ft_memset.c ft_bzero.c ft_memcpy.c ft_memccpy.c ft_memmove.c ft_memchr.c \
	  ft_memcmp.c ft_strlen.c ft_strlcpy.c ft_strlcat.c ft_strchr.c \
	  ft_strrchr.c ft_strnstr.c ft_strncmp.c ft_atoi.c ft_isalpha.c \
	  ft_isdigit.c ft_isalnum.c ft_isascii.c ft_isprint.c ft_toupper.c \
	  ft_tolower.c ft_calloc.c ft_strdup.c ft_substr.c ft_strjoin.c \
	  ft_strtrim.c ft_split.c ft_itoa.c ft_strmapi.c ft_putchar_fd.c \
	  ft_putstr_fd.c ft_putendl_fd.c ft_putnbr_fd.c ft_isupper.c ft_islower.c \
	  ft_isspace.c ft_strrev.c
BSRC = ft_lstnew_bonus.c ft_lstadd_front_bonus.c ft_lstsize_bonus.c \
	   ft_lstlast_bonus.c ft_lstadd_back_bonus.c ft_lstdelone_bonus.c \
	   ft_lstclear_bonus.c ft_lstiter_bonus.c ft_lstmap_bonus.c

OBJ = $(SRC:.c=.o)
BOBJ = $(BSRC:.c=.o)

NAME = libft.a

define ASCII
 ___        __         ___  __
/\\_ \\    __/\\ \\      /'___\\/\\ \\__
\\//\\ \\  /\\_\\ \\ \\____/\\ \\__/\\ \\ ,_\\
  \\ \\ \\ \\/\\ \\ \\ '__`\\ \\ ,__\\\\ \\ \\/
   \\_\\ \\_\\ \\ \\ \\ \\L\\ \\ \\ \\_/ \\ \\ \\_
   /\\____\\\\ \\_\\ \\_,__/\\ \\_\\   \\ \\__\\
   \\/____/ \\/_/\\/___/  \\/_/    \\/__/
endef

CRED = \x1b[31m
CGREEN = \x1b[32m
CYELLOW = \x1b[33m
CBLUE = \x1b[34m
CCYAN = \x1b[36m
CDEFAULT = \x1b[39m
CDEF = $(CDEFAULT)

CMINUS = $(CRED)[-]$(CDEF)
CPLUS = $(CGREEN)[+]$(CDEF)
CNORM = $(CYELLOW)[~]$(CDEF)

TIME = $(CCYAN)[$$(date +"%H:%M:%S")]$(CDEF)

.PHONY: clean fclean

all: ascii $(NAME)

export ASCII
ascii:
	@echo "\n$(CYELLOW)$$ASCII$(CDEF)\n"

$(NAME): $(OBJ)
	@echo "$(TIME) $(CPLUS) $(CGREEN)Adding objects to $@...$(CDEF)"
	@ar rcs $@ $^

bonus: $(NAME) | $(BOBJ)
	@echo "$(TIME) $(CPLUS) $(CGREEN)Adding bonus objects to $(NAME)...$(CDEF)"
	@ar rcs $(NAME) $|

%.o: %.c
	@echo "$(TIME) $(CPLUS) $(CBLUE)Compiling $< to $@...$(CDEF)"
	@$(CC) $(CFLAGS) -c $< -o $@

clean:
	@echo "$(TIME) $(CMINUS) $(CRED)Cleaning object files...$(CDEF)"
	@$(RM) $(OBJ) $(BOBJ)

fclean: clean
	@echo "$(TIME) $(CMINUS) $(CRED)Cleaning $(NAME)...$(CDEF)"
	@$(RM) $(NAME)

re: fclean all
