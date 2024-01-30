defmodule IronBond.Repo do
  use Ecto.Repo,
    otp_app: :iron_bond,
    adapter: Ecto.Adapters.Postgres
end
