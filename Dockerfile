# Copyright (c) 2019 FEROX YT EIRL, www.ferox.yt <devops@ferox.yt>
# Copyright (c) 2019 Jérémy WALTHER <jeremy.walther@golflima.net>
# See <https://github.com/frxyt/docker-git-quick-stats> for details.

FROM alpine

LABEL key="value"

RUN     apk add --no-cache bash git make ncurses util-linux\
    &&  git clone https://github.com/arzzen/git-quick-stats.git \
    &&  cd git-quick-stats \
    &&  make install \
    &&  cd .. \
    &&  rm -rf git-quick-stats \
    &&  apk del --no-cache make

ENV _GIT_SINCE= \
    _GIT_UNTIL= \
    _GIT_LIMIT= \
    _GIT_PATHSPEC= \
    _MENU_THEME=default

COPY Dockerfile LICENSE README.md /frx/

WORKDIR /git
ENTRYPOINT [ "/usr/bin/git", "quick-stats" ]