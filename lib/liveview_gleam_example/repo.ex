defmodule LiveviewGleamExample.Repo do
  use Ecto.Repo,
    otp_app: :liveview_gleam_example,
    adapter: Ecto.Adapters.Postgres
end
