###########
# BUILDER #
###########

# Setup the server

FROM node:12.16.3-alpine 

ENV NPM_CONFIG_PRODUCTION false

RUN addgroup -S app && adduser -S app -G app

RUN npm config set unsafe-perm true

ENV HOME=/home/app

COPY ./account-balance/ $HOME/account-balance
COPY ./pet-store/ $HOME/pet-store
COPY ./start.sh $HOME 
RUN chmod +x $HOME/start.sh
RUN chown -R app:app $HOME/*

USER app

WORKDIR $HOME
RUN ls -latr $HOME

CMD $HOME/start.sh
