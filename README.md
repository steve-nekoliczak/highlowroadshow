# highlowroadshow

## Local Development Setup in Ubuntu

- [Install postgres](#installing-postgres)
- [Install asdf and Elixir/Erlang](#installing-asdf-and-elixirerlang)
- [Configure the Application](#configuring-the-application)
- [Run the Server](#running-the-server)

## Installing Postgres

Install Postgres 18 [with this doc](https://www.postgresql.org/download/linux/ubuntu/).

### Troubleshooting Postgres

If you can't get into the postgres shell with the following command:

```zsh
psql -U postgres
```

You'll need to do the following things:

Change this line in `/etc/postgresql/18/main/pg_hba.conf` to have an `md5` authentication method (it typically has `peer` as the default setting):

```
# Database administrative login by Unix domain socket
local   all             postgres                                md5
```

Update the `postgres` user's password to be `postgres` (for local development only):

```zsh
sudo -u postgres psql

// While in the postgres shell:
ALTER USER postgres PASSWORD 'postgres';
exit
```

Restart the postgres service:

```zsh
sudo systemctl restart postgresql
```

## Installing asdf and Elixir/Erlang

Install and configure asdf [with this doc](https://asdf-vm.com/guide/getting-started.html#getting-started).

Then install Elixir and Erlang with asdf:

```zsh
asdf install elixir 1.19.4
asdf set elixir 1.19.4
asdf install erlang 28.3
asdf set erlang 28.3
```

## Configuring the Application

```zsh
mix deps.get
mix ecto.create
mix assets.setup
mix deps.compile
```

## Running the Server

Standard way to start the Phoenix server locally is:

```zsh
mix phx.server
```

To run in IEx (interactive Elixir) for debugging:

```zsh
iex -S mix phx.server
```
