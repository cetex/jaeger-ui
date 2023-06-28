FROM node

ADD ./*.lock /jaeger-ui/
ADD ./*.json /jaeger-ui/
ADD ./.*.yml /jaeger-ui/
ADD ./*.js /jaeger-ui/
ADD ./media/ /jaeger-ui/media
ADD ./packages/ /jaeger-ui/packages
ADD ./scripts/ /jaeger-ui/scripts

WORKDIR /jaeger-ui
RUN yarn install --frozen-lockfile

RUN cd packages/jaeger-ui && yarn build
RUN cd packages/jaeger-ui/build && tar -cvzf /jaeger-ui.tar.gz ./

