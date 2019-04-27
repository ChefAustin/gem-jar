# gem-jar
No nonsense Gemstash instance thrown in a container, backed by sqlite3 and wrapped-up with a bow. Non-configurable by design; for those that just want a no frills, quickly deployable Gem caching service.

## Getting started
1. `git clone https://github.com/chefaustin/gem-jar.git` <= Clone this repo
2. `cd gem-jar` <= Navigate into it
3. `docker run --name gem-jar -p 9292:9292 -v $(pwd)/db:/root/.gemstash chefaustin/gem-jar:latest` <= Bring container up
