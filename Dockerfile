# FROM ubuntu:22.10
FROM rust:1.69.0

WORKDIR /root
RUN apt-get -y update
# RUN apt-get install curl -y
# RUN apt-get install wget -y
# RUN apt-get install git -y
# RUN apt-get install gcc -y
# RUN apt-get install build-essential libreadline-dev zlib1g-dev flex bison libxml2-dev libxslt-dev libssl-dev libxml2-utils xsltproc ccache -y
# RUN apt-get install postgresql-server-14 -y
# RUN apt-get install postgresql-server-dev-14 -y
# RUN apt-get install pkg-config -y
RUN useradd -ms /bin/bash pgx
# RUN chmod -R a+wrx `pg_config --sharedir`
# RUN chmod -R a+wrx `pg_config --pkglibdir`
USER pgx
WORKDIR /home/pgx
# RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN cargo install --locked --version=0.6.1 cargo-pgx
RUN git clone https://github.com/supabase/wrappers.git
WORKDIR /home/pgx/wrappers/wrappers
# RUN /home/pgx/.cargo/bin/cargo pgx init --pg14 `which pg_config`
RUN cargo pgx init --pg14 download
RUN apt-get install clang -y
# RUN apt-get install jq -y
# RUN /home/pgx/.cargo/bin/cargo pgx install --features clickhouse_fdw
# RUN mkdir -p .pgx
# COPY config.toml .pgx/config.toml

