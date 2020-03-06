FROM ubuntu:latest

ENV TERM xterm-256color

RUN apt-get update
RUN apt-get -y install curl
RUN apt-get -y install git
RUN apt-get -y install locales
RUN apt-get -y install man
RUN apt-get -y install vim
RUN apt-get -y install wget
RUN apt-get -y install zsh
RUN apt-get -y install w3m
RUN apt-get -y install nkf
RUN apt-get -y install mecab
RUN apt-get -y install cowsay
RUN apt-get -y install moreutils
RUN apt-get -y install figlet
RUN apt-get -y install datamash
RUN apt-get -y install jq
RUN wget -nv https://raw.githubusercontent.com/fumiyas/home-commands/master/echo-sd && \
      install -m 0755 echo-sd /usr/bin/echo-sd && \
      rm echo-sd
RUN apt-get -y install build-essential
RUN git clone https://github.com/loretoparisi/kakasi.git && \
      cd kakasi && ./configure && make && make install

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
      locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN git clone https://github.com/zsh-users/zsh-autosuggestions "$HOME/.zsh/zsh-autosuggestions"
RUN git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh/zsh-syntax-highlighting"
RUN git clone git://github.com/zsh-users/zsh-completions.git "$HOME/.zsh/zsh-completions"
RUN git clone git://github.com/mollifier/anyframe.git "$HOME/.zsh/anyframe"
RUN git clone --depth 1 https://github.com/junegunn/fzf.git "$HOME/.fzf" && "$HOME/.fzf/install"

COPY .zshrc /root/.zshrc
COPY .zplug/ /root/.zplug
ENV HOME /root
WORKDIR /root

CMD ["zsh"]
