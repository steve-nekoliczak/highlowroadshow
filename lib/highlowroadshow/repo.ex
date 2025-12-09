defmodule Highlowroadshow.Repo do
  use Ecto.Repo,
    otp_app: :highlowroadshow,
    adapter: Ecto.Adapters.Postgres
end
