FROM ruby:2.4-alpine3.9

WORKDIR /

COPY / .

RUN bundle install

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh


ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["ruby", "executor.rb"]