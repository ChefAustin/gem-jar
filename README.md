# gem-jar

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/6e0b9c2abb9848f2ab7dca8d227786b2)](https://app.codacy.com/app/ChefAustin/gem-jar?utm_source=github.com&utm_medium=referral&utm_content=ChefAustin/gem-jar&utm_campaign=Badge_Grade_Dashboard)
[![Build Status](https://travis-ci.org/ChefAustin/gem-jar.svg?branch=master)](https://travis-ci.org/ChefAustin/gem-jar)

No nonsense Gemstash instance thrown in a container, backed by sqlite and wrapped-up with a bow. Non-configurable by design; for those that just want a no frills, quickly deployable Gem caching service.

## Getting started
1.  `git clone https://github.com/chefaustin/gem-jar.git` <= Clone this repo
2.  `cd gem-jar` <= Navigate into it
3.  `docker run -d --name gem-jar -p 9292:9292 -v ../db:/root/.gemstash chefaustin/gem-jar:latest` <= Bring container up
4.  `resp_key=$(docker exec -it gem-jar gemstash authorize | cut -d ' ' -f 5)` <= Generate and grab a new API key
5.  `mkdir -p ~/.gem; touch ~/.gem/credentials; echo ":gemstash: $resp_key"; chmod 0600 ~/.gem/credentials` <= Create and append key to `~/.gem/credentials`

## Improvements to come
### Tests
1.  [Container Structure](https://github.com/GoogleContainerTools/container-structure-test)
2.  [Serverspec](https://github.com/mizzy/serverspec)
3.  [Dockerspec](https://github.com/zuazo/dockerspec)
4.  Fine-tune Docker `HEALTHCHECK`

### Functionality
1.  Move to docker-compose with containerized ingress
2.  SSL/TLS termination (LetsEncrypt?)

### Other
1.  ~~Figure out proper FOSS `LICENSE`~~
2.  Build out wiki
