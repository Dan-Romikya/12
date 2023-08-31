defmodule Codigo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      CodigoWeb.Telemetry,
      # Start the Ecto repository
      Codigo.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Codigo.PubSub},
      # Start Finch
      {Finch, name: Codigo.Finch},
      # Start the Endpoint (http/https)
      CodigoWeb.Endpoint
      # Start a worker by calling: Codigo.Worker.start_link(arg)
      # {Codigo.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Codigo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CodigoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
