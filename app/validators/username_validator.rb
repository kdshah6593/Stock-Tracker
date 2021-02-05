class usernameValidator < ActiveModel::Validator
    def validate(record)
        if record.username.match(/[^a-zA-Z0-9]/)
            record.errors.add :username, "username must only be letters and numbers"
        end
    end
end