require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Rails_todo_App
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # generateファイルの設定
    config.generators do |g|
      g.skip_routes     true           # routes.rbにルーティングを追加しない、falseで追加する(falseがデフォルト)
      g.assets          false          # assets以下のファイル(CSS, JavaScriptファイル)を作成しない 
      
      # g.assetsは分けて記述することもできる
      # g.stylesheets   false          # stylesheets以下にファイルを作成しない  
      # g.javascripts   false          # javascripts以下にファイルを作成しない

      g.helper          false          # helper以下にファイルを作成しない 
      g.test_framework  false          # test以下にファイル作成しない     
    end
    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w(assets tasks))

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
