defmodule Webyep.Repo do
  use Ecto.Repo,
    otp_app: :webyep,
    adapter: Ecto.Adapters.Postgres
end
