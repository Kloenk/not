# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of the Config module.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
import Config

config :karma, Karma.SqliteStore.Repo, database: "karma_repo.sqlite"

config :karma,
  ecto_repos: [Karma.SqliteStore.Repo]

# Sample configuration:
#
#     config :logger, :console,
#       level: :info,
#       format: "$date $time [$level] $metadata$message\n",
#       metadata: [:user_id]
#

# config :bot, :nodes, nodes: [:first@localhost, :second@localhost, :third@localhost]
config :bot, :nodes, nodes: [Node.self()]

import_config "login.exs"
