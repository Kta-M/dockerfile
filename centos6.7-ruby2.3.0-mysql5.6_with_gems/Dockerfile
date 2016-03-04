FROM centos:6.7

ENV RUBY_VERSION 2.3.0
ENV MYSQL_RPM_VERSION mysql-community-release-el6-5.noarch.rpm

# Install packages for building ruby
RUN yum -y update
RUN yum install -y git gcc gcc-c++ make tar wget openssl-devel readline-devel sqlite-devel zlib zlib-devel file
RUN yum install -y libcurl-devel libyaml-devel libffi-devel bzip2 autoconf automake libtool bison libxml2-devel libxslt-devel
RUN yum install -y fontconfig freetype

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
RUN rbenv exec gem install rails -v 4.2.5.1
RUN rbenv exec gem install sass-rails -v 5.0.4
RUN rbenv exec gem install uglifier -v 2.7.2
RUN rbenv exec gem install coffee-rails -v 4.1.1
RUN rbenv exec gem install therubyracer -v 0.12.2
RUN rbenv exec gem install jquery-rails -v 4.1.0
RUN rbenv exec gem install jbuilder -v 2.4.1
RUN rbenv exec gem install sdoc -v 0.4.1
RUN rbenv exec gem install bcrypt -v 3.1.10
RUN rbenv exec gem install bootstrap-sass -v 3.3.6
RUN rbenv exec gem install momentjs-rails -v 2.11.0
RUN rbenv exec gem install bootstrap3-datetimepicker-rails -v 4.15.35
RUN rbenv exec gem install select2-rails -v 4.0.1
RUN rbenv exec gem install paranoia -v 2.1.5
RUN rbenv exec gem install paranoia_uniqueness_validator -v 1.1.0
RUN rbenv exec gem install kaminari -v 0.16.3
RUN rbenv exec gem install settingslogic -v 2.0.9
RUN rbenv exec gem install exception_notification -v 4.1.4
RUN rbenv exec gem install seed-fu -v 2.3.5
RUN rbenv exec gem install rubyXL -v 3.3.16
RUN rbenv exec gem install annotate -v 2.6.10
RUN rbenv exec gem install friendly_id -v 5.1.0
RUN rbenv exec gem install gon -v 6.0.1
RUN rbenv exec gem install ransack -v 1.7.0
RUN rbenv exec gem install rubyzip -v 1.2.0
RUN rbenv exec gem install nested_form -v 0.3.2
RUN rbenv exec gem install whenever -v 0.9.4
RUN rbenv exec gem install delayed_job_active_record -v 4.1.0
RUN rbenv exec gem install daemons -v 1.2.3
RUN rbenv exec gem install aws-sdk -v 2.2.18
RUN rbenv exec gem install byebug -v 8.2.2
RUN rbenv exec gem install web-console -v 2.3.0
RUN rbenv exec gem install spring -v 1.6.3
RUN rbenv exec gem install activerecord-import -v 0.11.0
RUN rbenv exec gem install pry-rails -v 0.3.4
RUN rbenv exec gem install pry-stack_explorer -v 0.4.9.2
RUN rbenv exec gem install better_errors -v 2.1.1
RUN rbenv exec gem install quiet_assets -v 1.1.0
RUN rbenv exec gem install rspec-rails -v 3.4.2
RUN rbenv exec gem install capybara -v 2.6.2
RUN rbenv exec gem install guard-rspec -v 4.6.4
RUN rbenv exec gem install factory_girl_rails -v 4.6.0
RUN rbenv exec gem install poltergeist -v 1.9.0
RUN rbenv exec gem install turnip -v 2.0.2
RUN rbenv exec gem install capistrano-rails -v 1.1.6
RUN rbenv exec gem install capistrano-bundler -v 1.1.4
RUN rbenv exec gem install capistrano-rbenv -v 2.0.4
RUN rbenv exec gem install capistrano-passenger -v 0.2.0
RUN rbenv exec gem install slackistrano -v 2.0.1
RUN rbenv exec gem install thin -v 1.6.4

# Install mysql
RUN yum install -y http://repo.mysql.com/$MYSQL_RPM_VERSION
RUN yum install -y mysql-community-server mysql-community-devel

ENV MYSQL_ROOT_PASSWORD 'password'
COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod 700 /entrypoint.sh

EXPOSE 3306

RUN . /entrypoint.sh mysqld --datadir=/var/lib/mysql --user=mysql

RUN rbenv exec gem install mysql2 -v 0.4.2

# Install packages for poltergeist
RUN cd /usr/local/src/ && wget https://phantomjs.googlecode.com/files/phantomjs-1.9.2-linux-x86_64.tar.bz2
RUN tar jxfv /usr/local/src/phantomjs-1.9.2-linux-x86_64.tar.bz2
RUN cp phantomjs-1.9.2-linux-x86_64/bin/phantomjs /usr/bin/

# yum clean
RUN yum clean all

