# gem-jar

[![Build Status](https://travis-ci.org/ChefAustin/gem-jar.svg?branch=master)](https://travis-ci.org/ChefAustin/gem-jar)

No nonsense Gemstash instance thrown in a container, backed by sqlite and wrapped-up with a bow. Non-configurable by design; for those that just want a no frills, quickly deployable Gem caching service.

## Getting started
1. `git clone https://github.com/chefaustin/gem-jar.git` <= Clone this repo
2. `cd gem-jar` <= Navigate into it
3. `docker run -d --name gem-jar -p 9292:9292 -v ../db:/root/.gemstash chefaustin/gem-jar:latest` <= Bring container up
4. `resp_key=$(docker exec -it gem-jar gemstash authorize | cut -d ' ' -f 5)` <= Generate and grab a new API key
5. `mkdir -p ~/.gem; touch ~/.gem/credentials; echo ":gemstash: $resp_key"; chmod 0600 ~/.gem/credentials` <= Create and append key to `~/.gem/credentials`

## Improvements to come:
- Tests:
  - [Container Structure](https://github.com/GoogleContainerTools/container-structure-test)
  - [Serverspec](https://github.com/mizzy/serverspec)
  - [Dockerspec](https://github.com/zuazo/dockerspec)
  - Fine-tune Docker `HEALTHCHECK`
- Other:
  - ~~Figure out proper FOSS `LICENSE`~~
  - Build out wiki
- Functionality:
  - Move to docker-compose with containerized ingress
  - SSL/TLS termination (LetsEncrypt?)
