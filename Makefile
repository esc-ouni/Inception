# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: idouni <idouni@student.1337.ma>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/10/19 11:19:01 by idouni            #+#    #+#              #
#    Updated: 2024/02/10 19:26:49 by idouni           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	@clear && echo "==Start======================"
	docker-compose -f ./srcs/docker-compose.yml up
	@echo "==Done======================="

rm_i:
	@docker rmi -f ${shell docker image ls -aq} || echo "Nothing_to_delete"

rm_c:
	@docker rm -f ${shell docker container ls -aq} || echo "Nothing_to_delete"

clean: rm_c
	@clear && echo "==Clean_Containers==============="

fclean: rm_c rm_i
	@clear && echo "==Clean_Images_&_Containers=="

re: fclean all

.PHONY: all fclean clean  rm_i rm_c
