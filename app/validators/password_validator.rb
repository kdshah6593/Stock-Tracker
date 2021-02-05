class passwordValidator < ActiveModel::Validator
    def validate(record)
        if record.password.match(/[ ]/)
            record.errors.add :password, "Passwords cannot contain spaces"
        end
    end
end