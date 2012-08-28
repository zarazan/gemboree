module Gemboree
  module Generators
    class MigrationGenerator < Rails::Generators::Base
      
      include Rails::Generators::Migration

      source_root File.expand_path("../../../templates/migration/", __FILE__)

      def self.next_migration_number(dirname)
        if ActiveRecord::Base.timestamped_migrations
          migration_number = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
          migration_number += 1
          migration_number.to_s
        else
          "%.3d" % (current_migration_number(dirname) + 1)
        end
      end

      def create_migration
        migration_template "migration.rb", "db/migrate/acts_as_actor"
      end

    end
  end
end