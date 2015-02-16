module Embulk

  class FileOutputPlugin
    # TODO transaction, resume, cleanup
    # TODO add, finish, close, abort, commit

    if Embulk.java?
      # TODO to_java

      def self.from_java(java_class)
        JavaPlugin.ruby_adapter_class(java_class, FileOutputPlugin, RubyAdapter)
      end

      module RubyAdapter
        module ClassMethods
          def new_java
            Java::FileOutputRunner.new(Java.injector.getInstance(java_class))
          end
          # TODO transaction, resume, cleanup
        end

        # TODO add, finish, close, abort, commit
      end
    end
  end

end