module TwittersHelper
    def choose_create_or_edit
        if action_name == 'new' || action_name == 'create'
            confirm_twitters_path
        elsif action_name == 'edit'
            twitter_path
        end
    end
end
