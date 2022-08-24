defmodule Ordigi.Repo do
  use Ecto.Repo,
    otp_app: :ordigi,
    adapter: Ecto.Adapters.Postgres
end
