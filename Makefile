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
	docker-compose -f srcs/. up --no-cache
	@clear && echo "==Docker===================="

rm_i:
	@docker rmi -f ${docker image ls -aq}

rm_c:
	@docker rm -f ${docker container ls -aq}

clean: rm_i
	@clear && echo "==Clean_Images==============="

fclean: rm_c rm_i
	@clear && echo "==Clean_Images_&_Containers=="

re: fclean all
	@clear && echo "==Re_Build==================="

.PHONY: all bonus fclean clean rm_i rm_c
