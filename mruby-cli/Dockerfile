FROM centos:6.8

# Install packages for building ruby
RUN yum -y update
RUN yum install -y \
  automake \
  bison \
  build-essential \
  bzip2 \
  ca-certificates \
  clang \
  cpio \
  curl \
  debhelper \
  file \
  g++-multilib \
  gcc-multilib \
  genisoimage \
  git \
  gobject-introspection \
  gzip \
  intltool \
  libgirepository1.0-dev \
  libgsf-1-dev \
  libssl-dev \
  libtool \
  libxml2-dev \
  llvm-dev \
  make \
  mingw-w64 \
  openssl-devel \
  patch \
  readline-devel \
  rpm \
  sed \
  tar \
  uuid-dev \
  valac \
  wget \
  xz-utils \
  zlib-devel

# Install rbenv and ruby-build
RUN git clone https://github.com/rbenv/rbenv.git /root/.rbenv
RUN git clone https://github.com/rbenv/ruby-build.git /root/.rbenv/plugins/ruby-build
RUN ./root/.rbenv/plugins/ruby-build/install.sh
ENV PATH /root/.rbenv/bin:$PATH
RUN echo 'export PATH=/root/.rbenv/bin:$PATH' >> /root/.bashrc
RUN eval "$(rbenv init -)"
RUN echo 'eval "$(rbenv init -)"' >> /root/.bashrc

# Install ruby
ENV RUBY_VERSION 2.3.1
ENV CONFIGURE_OPTS --disable-install-doc
RUN rbenv install $RUBY_VERSION
RUN rbenv global $RUBY_VERSION

# Install Bundler for ruby
RUN echo 'gem: --no-rdoc --no-ri' >> /.gemrc
RUN rbenv exec gem install fpm

# yum clean
RUN yum clean all

ONBUILD WORKDIR /home/mruby/code
ONBUILD ENV GEM_HOME /home/mruby/.gem/

ONBUILD ENV PATH $GEM_HOME/bin/:$PATH
ONBUILD ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib/
