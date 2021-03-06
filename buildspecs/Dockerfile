FROM ruby:2.5.1

ENV LANG C.UTF-8
ENV RAILS_ENV production

RUN apt-get update -qq && apt-get upgrade -y && \
  apt-get install -y build-essential && \
  apt-get install -y curl && \
  curl --silent --location https://deb.nodesource.com/setup_8.x | bash && \
  apt-get install -y nodejs

RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock

RUN gem install bundler
RUN bundle install -j4 --path /usr/local/bundle
ADD . /myapp

EXPOSE 3000

# ARG SECRET_KEY_BASE
# ARG AWS_ACCESS_KEY_ID
# ARG S3_BUCKET
# ARG AWS_DEFAULT_REGION
# ARG AWS_SECRET_ACCESS_KEY
# ARG SES_ACCESS_KEY_ID
# ARG SES_DEFAULT_REGION
# ARG SES_SECRET_ACCESS_KEY
# ARG RDS_USERNAME
# ARG RDS_PASSWORD
# ARG RDS_HOSTNAME
# ARG ROLLBAR_TOKEN
# ARG RAILS_SERVE_STATIC_FILES
# ARG TEST_VARIABLE

# ENV SECRET_KEY_BASE $SECRET_KEY_BASE
# ENV AWS_ACCESS_KEY_ID $AWS_ACCESS_KEY_ID
# ENV S3_BUCKET $S3_BUCKET
# ENV AWS_DEFAULT_REGION $AWS_DEFAULT_REGION
# ENV AWS_SECRET_ACCESS_KEY $AWS_SECRET_ACCESS_KEY
# ENV SES_ACCESS_KEY_ID $SES_ACCESS_KEY_ID
# ENV SES_DEFAULT_REGION $SES_DEFAULT_REGION
# ENV SES_SECRET_ACCESS_KEY $SES_SECRET_ACCESS_KEY
# ENV RDS_USERNAME $RDS_USERNAME
# ENV RDS_PASSWORD $RDS_PASSWORD
# ENV RDS_HOSTNAME $RDS_HOSTNAME
# ENV ROLLBAR_TOKEN $ROLLBAR_TOKEN
# ENV RAILS_SERVE_STATIC_FILES $RAILS_SERVE_STATIC_FILES
# ENV TEST_VARIABLE $TEST_VARIABLE

RUN RAILS_ENV=$RAILS_ENV DB_ADAPTER=nulldb bundle exec rake assets:precompile assets:clean

ADD buildspecs/start.sh /start.sh
RUN chmod +x /start.sh
CMD ["/start.sh"]