defmodule Karma.Supervisor do
  use Supervisor

  def start_link(arg) do
    Supervisor.start_link(__MODULE__, arg, name: __MODULE__)
  end

  def init(_) do
    children = [
      {Task.Supervisor, name: Karma.TaskSupervisor},
      {Karma.SqliteStore.Supervisor, nil},

      # {Karma.MemoryStore, nil},
      {Karma.StoreAdapter, Karma.SqliteStore},
      {Karma, nil}
    ]

    opts = [strategy: :one_for_one]
    Supervisor.init(children, opts)
  end
end
