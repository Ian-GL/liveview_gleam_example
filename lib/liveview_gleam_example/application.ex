defmodule LiveviewGleamExample.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      LiveviewGleamExample.Repo,
      # Start the Telemetry supervisor
      LiveviewGleamExampleWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: LiveviewGleamExample.PubSub},
      # Start the Endpoint (http/https)
      LiveviewGleamExampleWeb.Endpoint
      # Start a worker by calling: LiveviewGleamExample.Worker.start_link(arg)
      # {LiveviewGleamExample.Worker, arg}
    ]
    Faker.start()

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LiveviewGleamExample.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    LiveviewGleamExampleWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
