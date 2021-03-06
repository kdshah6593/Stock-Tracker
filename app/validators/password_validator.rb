class PasswordValidator < ActiveModel::Validator
    def validate(record)
        if record.password.match(/[ ]/)
            record.errors.add :password, "cannot contain spaces"
        end
    end
end