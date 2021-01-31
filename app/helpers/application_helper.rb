module ApplicationHelper

    def display_form_errors(x)
        if x.errors.any?
            x.errors.collect do |error|
                error.full_message
            end
        end
    end

    def display_errors(y)
        form_errors(y).each do |error|
            tag.div tag.p(error)
            tag.br
        end
    end
end