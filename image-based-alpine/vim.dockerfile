FROM  airdb/alpine
MAINTAINER  Dean <Dean@airdb.com>

# Build image: 
# docker build . --rm -t airdb/alpine-nginx -f  nginx.dockerfile
# Run Container:
# docker run -d --name access airdb/alpine-toolbox

# Step 1: List service infomation and choose stable version.
# ENV SERVICE go
# ENV VERSION 1.9.2
# ENV SERVICE_PKG $SERVICE$VERSION.linux-amd64.tar.gz
#wget https://redirector.gvt1.com/edgedl/go/go1.4.linux-amd64.tar.gz

#ENV LANG en_US.UTF-8
#ENV PS1 "[\u@\H.airdb.io \W]\$ "
#ENV HOMEDIR /srv
# WORKDIR $HOMEDIR
#ENV GOPATH /srv \
ENV UHOME /root

# bash \
# openssh \
#    mysql-client \
#    vim \
#    ca-certificates \
#    wget \
RUN apk add --no-cache --virtual .build-deps vim curl git

# Plugins && Theme
RUN mkdir -p $UHOME/bundle \
    && cd $UHOME/bundle/ \
    && git clone --depth 1 https://github.com/VundleVim/Vundle.vim \
    && git clone --depth 1 https://github.com/altercation/vim-colors-solarized
#    && git clone --depth 1 https://github.com/pangloss/vim-javascript \
#    && git clone --depth 1 https://github.com/scrooloose/nerdcommenter \
#    && git clone --depth 1 https://github.com/godlygeek/tabular \
#    && git clone --depth 1 https://github.com/Raimondi/delimitMate \
#    && git clone --depth 1 https://github.com/nathanaelkane/vim-indent-guides \
#    && git clone --depth 1 https://github.com/groenewege/vim-less \
#    && git clone --depth 1 https://github.com/othree/html5.vim \
#    && git clone --depth 1 https://github.com/elzr/vim-json \
#    && git clone --depth 1 https://github.com/bling/vim-airline \
#    && git clone --depth 1 https://github.com/easymotion/vim-easymotion \
#    && git clone --depth 1 https://github.com/mbbill/undotree \
#    && git clone --depth 1 https://github.com/majutsushi/tagbar \
#    && git clone --depth 1 https://github.com/vim-scripts/EasyGrep \
#    && git clone --depth 1 https://github.com/jlanzarotta/bufexplorer \
#    && git clone --depth 1 https://github.com/kien/ctrlp.vim \
#    && git clone --depth 1 https://github.com/scrooloose/nerdtree \
#    && git clone --depth 1 https://github.com/jistr/vim-nerdtree-tabs \
#    && git clone --depth 1 https://github.com/scrooloose/syntastic \
#    && git clone --depth 1 https://github.com/tomtom/tlib_vim \
#    && git clone --depth 1 https://github.com/marcweber/vim-addon-mw-utils \
#    && git clone --depth 1 https://github.com/vim-scripts/taglist.vim \
#    && git clone --depth 1 https://github.com/terryma/vim-expand-region \
#    && git clone --depth 1 https://github.com/tpope/vim-fugitive \
#    && git clone --depth 1 https://github.com/airblade/vim-gitgutter \
#    && git clone --depth 1 https://github.com/fatih/vim-go \
#    && git clone --depth 1 https://github.com/plasticboy/vim-markdown \
#    && git clone --depth 1 https://github.com/michaeljsmith/vim-indent-object \
#    && git clone --depth 1 https://github.com/terryma/vim-multiple-cursors \
#    && git clone --depth 1 https://github.com/tpope/vim-repeat \
#    && git clone --depth 1 https://github.com/tpope/vim-surround \
#    && git clone --depth 1 https://github.com/vim-scripts/mru.vim \
#    && git clone --depth 1 https://github.com/vim-scripts/YankRing.vim \
#    && git clone --depth 1 https://github.com/tpope/vim-haml \
#    && git clone --depth 1 https://github.com/SirVer/ultisnips \
#    && git clone --depth 1 https://github.com/honza/vim-snippets \
#    && git clone --depth 1 https://github.com/derekwyatt/vim-scala \
#    && git clone --depth 1 https://github.com/christoomey/vim-tmux-navigator \
#    && git clone --depth 1 https://github.com/ekalinin/Dockerfile.vim \

# Build default .vimrc
RUN curl -s https://raw.githubusercontent.com/amix/vimrc/master/vimrcs/basic.vim  >> $UHOME/.vimrc \
    && curl -s https://raw.githubusercontent.com/amix/vimrc/master/vimrcs/extended.vim >> $UHOME/.vimrc \
    && echo "set nocompatible" >> $UHOME/.vimrc \
    && echo "filetype off" >> $UHOME/.vimrc \
    && echo "set rtp+=~/bundle/Vundle.vim" >> $UHOME/.vimrc \
    && echo "call vundle#begin()" >> $UHOME/.vimrc \
    && echo "call vundle#end()" >> $UHOME/.vimrc \
    && echo "filetype plugin indent on" >> $UHOME/.vimrc \
    && echo "Plugin 'https://github.com/fatih/vim-go'" >> $UHOME/.vimrc \
    && echo "Plugin 'https://github.com/pangloss/vim-javascript'">> $UHOME/.vimrc \
    && echo "Plugin 'https://github.com/scrooloose/nerdcommenter'">> $UHOME/.vimrc \
    && echo "Plugin 'https://github.com/godlygeek/tabular'">> $UHOME/.vimrc \
    && echo "Plugin 'https://github.com/Raimondi/delimitMate'">> $UHOME/.vimrc \
    && echo "Plugin 'https://github.com/nathanaelkane/vim-indent-guides'">> $UHOME/.vimrc \
    && echo "Plugin 'https://github.com/groenewege/vim-less'">> $UHOME/.vimrc \
    && echo "Plugin 'https://github.com/othree/html5.vim'">> $UHOME/.vimrc \
    && echo "Plugin 'https://github.com/elzr/vim-json'">> $UHOME/.vimrc \
    && echo "Plugin 'https://github.com/bling/vim-airline'">> $UHOME/.vimrc \
    && echo "Plugin 'https://github.com/easymotion/vim-easymotion'">> $UHOME/.vimrc \
    && echo "Plugin 'https://github.com/mbbill/undotree'">> $UHOME/.vimrc \
    && echo "Plugin 'https://github.com/majutsushi/tagbar'">> $UHOME/.vimrc \
    && echo "Plugin 'https://github.com/vim-scripts/EasyGrep'">> $UHOME/.vimrc \
    && echo "Plugin 'https://github.com/jlanzarotta/bufexplorer'">> $UHOME/.vimrc \
    && echo "Plugin 'https://github.com/kien/ctrlp.vim'">> $UHOME/.vimrc \
    && echo "Plugin 'https://github.com/scrooloose/nerdtree'">> $UHOME/.vimrc \
    && echo "Plugin 'https://github.com/jistr/vim-nerdtree-tabs'">> $UHOME/.vimrc \
    && echo "Plugin 'https://github.com/scrooloose/syntastic'">> $UHOME/.vimrc \
    && echo "Plugin 'https://github.com/tomtom/tlib_vim'">> $UHOME/.vimrc \
    && echo "Plugin 'https://github.com/marcweber/vim-addon-mw-utils'">> $UHOME/.vimrc \
    && echo "Plugin 'https://github.com/vim-scripts/taglist.vim'">> $UHOME/.vimrc \
    && echo "Plugin 'https://github.com/terryma/vim-expand-region'">> $UHOME/.vimrc \
    && echo "Plugin 'https://github.com/tpope/vim-fugitive'">> $UHOME/.vimrc \
    && echo "Plugin 'https://github.com/airblade/vim-gitgutter'">> $UHOME/.vimrc \
    && echo "Plugin 'https://github.com/fatih/vim-go'">> $UHOME/.vimrc \
    && echo "Plugin 'https://github.com/plasticboy/vim-markdown'">> $UHOME/.vimrc \
    && echo "Plugin 'https://github.com/michaeljsmith/vim-indent-object'">> $UHOME/.vimrc \
    && echo "Plugin 'https://github.com/terryma/vim-multiple-cursors'">> $UHOME/.vimrc \
    && echo "Plugin 'https://github.com/tpope/vim-repeat'">> $UHOME/.vimrc \
    && echo "Plugin 'https://github.com/tpope/vim-surround'">> $UHOME/.vimrc \
    && echo "Plugin 'https://github.com/vim-scripts/mru.vim'">> $UHOME/.vimrc \
    && echo "Plugin 'https://github.com/vim-scripts/YankRing.vim'">> $UHOME/.vimrc \
    && echo "Plugin 'https://github.com/tpope/vim-haml'">> $UHOME/.vimrc \
    && echo "Plugin 'https://github.com/SirVer/ultisnips'">> $UHOME/.vimrc \
    && echo "Plugin 'https://github.com/honza/vim-snippets'">> $UHOME/.vimrc \
    && echo "Plugin 'https://github.com/derekwyatt/vim-scala'">> $UHOME/.vimrc \
    && echo "Plugin 'https://github.com/christoomey/vim-tmux-navigator'">> $UHOME/.vimrc \
    && echo "Plugin 'https://github.com/ekalinin/Dockerfile.vim'">> $UHOME/.vimrc \
    && sed -i '/colorscheme peaksea/d' $UHOME/.vimrc

#RUN vim -E -c 'PluginInstall' -c q ; return 0
RUN vim -c 'PluginInstall' -c 'qa!' >/dev/null ; return 0


VOLUME ["/srv"]
ENTRYPOINT ["vim"]
#CMD ["/bin/sh"]


