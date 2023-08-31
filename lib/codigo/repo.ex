defmodule Codigo.Repo do
  use Ecto.Repo,
    otp_app: :codigo,
    adapter: Ecto.Adapters.Postgres
end
