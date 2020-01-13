FROM node:12.14.1-alpine3.11
ENV LANG jp_JP.UTF-8
RUN apk update \
  && apk add --no-cache git ca-certificates emacs fontconfig \
  && git clone https://github.com/tsukudamayo/dotfiles.git \
  && cp -r ./dotfiles/linux/.emacs.d ~/ \
  && cp -r ./dotfiles/.fonts /usr/share/fonts \
  && fc-cache -fv
RUN mkdir -p /app
WORKDIR /app

EXPOSE 3000
CMD ["/bin/sh"]
