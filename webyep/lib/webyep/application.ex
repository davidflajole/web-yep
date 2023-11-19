defmodule Webyep.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      WebyepWeb.Telemetry,
      # Start the Ecto repository
      Webyep.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Webyep.PubSub},
      # Start Finch
      {Finch, name: Webyep.Finch},
      # Start the Endpoint (http/https)
      WebyepWeb.Endpoint
      # Start a worker by calling: Webyep.Worker.start_link(arg)
      # {Webyep.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Webyep.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    WebyepWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
