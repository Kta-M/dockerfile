FROM centos:6.7

ENV RUBY_VERSION 2.2.2
ENV MYSQL_RPM_VERSION mysql-community-release-el6-5.noarch.rpm

# Install packages for building ruby
RUN yum -y update
RUN yum install -y git gcc gcc-c++ make tar wget openssl-devel readline-devel sqlite-devel zlib zlib-devel file
RUN yum install -y libcurl-devel libyaml-devel libffi-devel bzip2 autoconf automake libtool bison libxml2-devel libxslt-devel

# Install rbenv and ruby-build
RUN git clone https://github.com/sstephenson/rbenv.git /root/.rbenv
RUN git clone https://github.com/sstephenson/ruby-build.git /root/.rbenv/plugins/ruby-build
RUN ./root/.rbenv/plugins/ruby-build/install.sh
ENV PATH /root/.rbenv/bin:$PATH
RUN echo 'export PATH=/root/.rbenv/bin:$PATH' >> /root/.bashrc
RUN echo 'eval "$(rbenv init -)"' >> /root/.bashrc

# Install ruby
ENV CONFIGURE_OPTS --disable-install-doc
RUN rbenv install $RUBY_VERSION
RUN rbenv global $RUBY_VERSION

# Install Bundler for ruby
RUN echo 'gem: --no-rdoc --no-ri' >> /.gemrc
RUN rbenv exec gem install bundler

# Install gems
RUN rbenv exec gem install rails -v 4.2.1
RUN rbenv exec gem install sass-rails -v '~> 5.0'
RUN rbenv exec gem install uglifier -v '>= 1.3.0'
RUN rbenv exec gem install coffee-rails -v '~> 4.1.0'
RUN rbenv exec gem install jquery-rails
RUN rbenv exec gem install jbuilder -v '~> 2.0'
RUN rbenv exec gem install bcrypt -v '~> 3.1.7'
RUN rbenv exec gem install bootstrap-sass
RUN rbenv exec gem install momentjs-rails
RUN rbenv exec gem install bootstrap3-datetimepicker-rails
RUN rbenv exec gem install select2-rails
RUN rbenv exec gem install paranoia -v '~> 2.0'
RUN rbenv exec gem install paranoia_uniqueness_validator
RUN rbenv exec gem install kaminari
RUN rbenv exec gem install settingslogic
RUN rbenv exec gem install exception_notification
RUN rbenv exec gem install seed-fu
RUN rbenv exec gem install rubyXL
RUN rbenv exec gem install annotate -v '~> 2.6.6'
RUN rbenv exec gem install friendly_id -v '~> 5.1.0'
RUN rbenv exec gem install gon
RUN rbenv exec gem install ransack
RUN rbenv exec gem install rubyzip
RUN rbenv exec gem install nested_form
RUN rbenv exec gem install delayed_job_active_record
RUN rbenv exec gem install daemons
RUN rbenv exec gem install aws-sdk -v '~> 2'
RUN rbenv exec gem install byebug
RUN rbenv exec gem install web-console -v '~> 2.0'
RUN rbenv exec gem install spring
RUN rbenv exec gem install activerecord-import
RUN rbenv exec gem install pry-rails
RUN rbenv exec gem install pry-stack_explorer
RUN rbenv exec gem install better_errors
RUN rbenv exec gem install quiet_assets
RUN rbenv exec gem install rspec-rails
RUN rbenv exec gem install capybara
RUN rbenv exec gem install guard-rspec
RUN rbenv exec gem install factory_girl_rails
RUN rbenv exec gem install poltergeist
RUN rbenv exec gem install turnip
RUN rbenv exec gem install capistrano-rails
RUN rbenv exec gem install capistrano-bundler
RUN rbenv exec gem install capistrano-rbenv
RUN rbenv exec gem install capistrano-passenger
RUN rbenv exec gem install thin

# Install mysql
RUN yum install -y http://repo.mysql.com/$MYSQL_RPM_VERSION
RUN yum install -y mysql-community-server mysql-community-devel

ENV MYSQL_ROOT_PASSWORD 'password'
COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod 700 /entrypoint.sh

EXPOSE 3306

RUN . /entrypoint.sh mysqld --datadir=/var/lib/mysql --user=mysql

# Install packages for poltergeist
RUN cd /usr/local/src/ && wget https://phantomjs.googlecode.com/files/phantomjs-1.9.2-linux-x86_64.tar.bz2
RUN tar jxfv /usr/local/src/phantomjs-1.9.2-linux-x86_64.tar.bz2
RUN cp phantomjs-1.9.2-linux-x86_64/bin/phantomjs /usr/bin/

# yum clean
RUN yum clean all

