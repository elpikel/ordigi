defmodule Ordigi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Ordigi.Repo,
      # Start the Telemetry supervisor
      OrdigiWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Ordigi.PubSub},
      # Start the Endpoint (http/https)
      OrdigiWeb.Endpoint
      # Start a worker by calling: Ordigi.Worker.start_link(arg)
      # {Ordigi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Ordigi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    OrdigiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
