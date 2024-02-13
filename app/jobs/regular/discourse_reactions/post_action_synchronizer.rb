# frozen_string_literal: true

module Jobs
  module DiscourseReactions
    class PostActionSynchronizer < ::Jobs::Base
      def execute(args = {})
        if !SiteSetting.discourse_reactions_enabled ||
             !SiteSetting.discourse_reactions_like_sync_enabled
          return
        end

        ::DiscourseReactions::ReactionPostActionSynchronizer.sync!
      end
    end
  end
end
