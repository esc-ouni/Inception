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
	docker-compose -f ./srcs/docker-compose.yml up -d
	@echo "==Done======================="

stop:
	docker-compose -f ./srcs/docker-compose.yml stop
	@clear && echo "==Stop======================="

ps:
	@clear && echo "==Stat======================="
	docker-compose -f ./srcs/docker-compose.yml ps -a

rm_i:
	@docker rmi -f ${shell docker image ls -aq} || echo "Nothing_to_delete"

rm_c:
	@docker rm -f ${shell docker container ls -aq} || echo "Nothing_to_delete"

rm_v:
	@docker volume rm -f ${shell docker volume ls -q} || echo "Nothing_to_delete"

clean: rm_c rm_i rm_v
	@clear && echo "==Clean_Containers==============="

fclean: rm_c rm_i rm_v
	docker-compose -f ./srcs/docker-compose.yml down
	@clear && echo "==Clean_Images_&_Containers=="

reboot:
	docker system prune -af

re: fclean all

.PHONY: all fclean clean  rm_i rm_c rm_v ps stop
